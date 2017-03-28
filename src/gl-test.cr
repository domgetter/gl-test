require "./gl-test/*"

module Gl::Test
  # TODO Put your code here
end

@[Link("gl")]
lib LibGL
  fun clear = glClear(mask: UInt32)
  GL_COLOR_BUFFER_BIT = 0x00004000
end

LibGL.clear(LibGL::GL_COLOR_BUFFER_BIT)

@[Link("glut")]
lib LibFreeglut
  fun init = glutInit(pargc: Int32*, argv: UInt8**)
  fun init_display_mode = glutInitDisplayMode( mode: UInt32 )
  fun init_window_size = glutInitWindowSize( width: Int32, height: Int32 )
  fun init_window_position = glutInitWindowPosition( x: Int32, y: Int32 )
  fun create_window = glutCreateWindow( title: UInt8* )
  fun main_loop = glutMainLoop()

  # GLUT API macro definitions -- the display mode definitions
  # 
  GLUT_RGB         = 0x0000
  GLUT_RGBA        = 0x0000
  GLUT_INDEX       = 0x0001
  GLUT_SINGLE      = 0x0000
  GLUT_DOUBLE      = 0x0002
  GLUT_ACCUM       = 0x0004
  GLUT_ALPHA       = 0x0008
  GLUT_DEPTH       = 0x0010
  GLUT_STENCIL     = 0x0020
  GLUT_MULTISAMPLE = 0x0080
  GLUT_STEREO      = 0x0100
  GLUT_LUMINANCE   = 0x0200


end

def new_window(title = "", size = {640, 480}, position = {0, 0}, mode = LibFreeglut::GLUT_SINGLE)
  a = 0
  b = 0u8
  p_a = pointerof(a)
  p_b = Pointer(UInt8).new(b)

  LibFreeglut.init(p_a, pointerof(p_b))
  LibFreeglut.init_display_mode(mode)
  LibFreeglut.init_window_size(width: size[0], height: size[1])
  LibFreeglut.init_window_position(x: position[0], y: position[1])
  LibFreeglut.create_window(title)
  LibFreeglut.main_loop()
end

new_window(title: "New Freeglut Window")

