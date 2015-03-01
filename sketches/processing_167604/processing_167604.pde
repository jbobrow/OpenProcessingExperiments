

//==========================================================
//
// sketch:  GLSL_demos.pde    by Gerd Platl
//
// v1.0  2014-09-18  inital release
// v1.1  2014-09-20  demo20039 added
//       2014-10-21  working on...
//
// This sketch is a try to run a GLSL (OpenGL Shading Language) 
// program as processing sketch without making great changes 
// of GLSL code within the main() function.
//
// tags: GLSL, OpenGL Shading Language, demos  
//==========================================================

/* @pjs preload="GLSL_demos.png"; */

String version = "GLSL_demos v1.1";

int startWithDemoNumber = 4;
int demoIndex = startWithDemoNumber;
PImage img;


//------------------------
void setup()
{
  size(400, 400, P2D);
 // println (version);
  initGLSL();
  selectDemo(startWithDemoNumber);
  img = loadImage("GLSL_demos.png");
  img.resize(width, height);
  //background(img);
  //imageMode(LEFT,TOP);
}
//------------------------
void draw()
{
  if (frameCount <= 60)
  {
    //background (0);
    background (img);
    //image(img, 0, 0);
 
    fill(255);
    text (version,22,33);
    text("press 1 .. 4 to select demo",22,66);
    fill(255,55,55);  
    text("This sketch do not run with javascript.",22,99);
    text("Please download and run this sketch offline.",22,122);
  }
  else drawGLSL();
}
//------------------------
void keyPressed()
{
  if ((key >= '0') && (key <= '9'))
  {
    demoIndex = int(key) - 48;
    println ("select demo " + demoIndex);
    selectDemo(demoIndex);
  }
  else if (key == 's')
  { 
    String filename = "GLSL_demos_" + demoIndex + ".png";
    save(filename);
    println ("file '" + filename + "' saved");
  }
}

//----------------------------------------------------------
// set list of all demos 
//----------------------------------------------------------
GLSLInterface[] functions = new GLSLInterface[]
{ 
  new demoRandomDots(),     //0
  new demoRandomDots(),     //1
  new demo19987(), 
  new demo19867(), 
  new demo20039(),
  new demo20086(),          //5
  new demoRGB(),
  new demo9863(),
  new demoRandomDots(),
  new demoRandomDots(),     //9
};
int demoCount = functions.length;

//--------------------------------------------------
// basic GLSL example: random color points 
//--------------------------------------------------
class demoRandomDots implements GLSLInterface 
{ 
  void _main()
  {
    vec3 col = vec3(random(1.0), random(1.0), random(1.0));
    gl_FragColor = vec4(col, 1.0);
  }
}
//--------------------------------------------------
// GLSL example: pulsing red sun
//   see http://glslsandbox.com/e#19987.00
//--------------------------------------------------
class demo19987 implements GLSLInterface 
{ 
  void _main() 
  {
    //  float intensity = 105.0;   // Lower number = more 'glow'
    vec3 light_color = vec3(0.5, 0.1, 0.1); // RGB, proportional values, higher increases intensity
    float master_scale = pow(10.0, sin(time*0.05)) * 0.1;  // Change the size of the effect
    float c = 1000 * master_scale / length(surfacePosition);
    //  gl_FragColor = vec4(light_color * c, 0.3);
    vec3 col = light_color.get();
    col.mult(c);

    gl_FragColor = vec4(col, 0.3);
  }
}
//--------------------------------------------------
// GLSL example: 3 moving stars 
//   see http://glslsandbox.com/e#19867.0
//--------------------------------------------------
class demo19867 implements GLSLInterface 
{
  void _main() 
  {
    float _time = time * 0.05;
    vec3 col = vec3(0.0, 0.0, 0.0);
    for (int i=0; i<3; i++)
    { 
      float i2 = i*i;
      float i3 = i2*i;

      //# vec2 p = gl_FragCoord.xy / resolution.x - vec2(0.5, 0.5 * resolution.y / resolution.x) 
      //#             + vec2(sin(float(i*i) + 0.5*time), sin(float(i*i*i) + 0.8*time)) * 0.25;
      vec2 v1 = vec2(0.5, 0.5 * resolution.y / resolution.x);
      vec2 v2 = vec2(sin(i2 + 0.5*_time), sin(i3 + 0.8*_time)); 
      v2.mult(0.25);
      vec2 p = vec2 (gl_FragCoord.x / resolution.x, gl_FragCoord.y / resolution.y);
      p.sub(v1);                   
      p.add(v2);                   

      float l = length(p);
      float a = atan2(p.y, p.x);  //# float a = atan(p.y, p.x);

      col.x += pow(1.0 - l, 2.0) + sin(a * 15.0 + 2.0 * _time + sin(a * 7.0 + 13.0 * _time) * 0.01) * 0.2 + sin(a * 3.0 + 13.0* _time) * 0.4;

      col.y += col.x * (sin(col.x) * 0.5 + 0.5);
      if (col.x < 0.0) col.y = -col.x;
      col.z += 0.25;
      col.mult(0.5);  //# col *= 0.5;

      col.x = pow (col.y, sin(i2 + 2.5 * _time)* 0.5 + 1.5);
      col.y = pow (col.y, sin(i3 + 4.3 * _time) * 0.5 + 1.5);
      col.z = pow (col.z, sin(i3*i + 3.2 * _time) * 0.5 + 1.5);
    }

    gl_FragColor = vec4(col, 1.0);
  }
}

//--------------------------------------------------
// GLSL example: blue waves 
//   see http://glslsandbox.com/e#20039.0
//--------------------------------------------------
class demo20039 implements GLSLInterface 
{
  void _main() 
  {
    final int MAX_ITER = 4;
    vec2 p = vec2(surfacePosition); //.4, .7); // surfacePosition;
  //  vec2 p = sp*5.0 - vec2(10.0);
    p.mult(0.02);   p.add(vec2(-10.0));
    vec2 i = new vec2(p);
    
    float c = 0.6;
    float inten = 0.1;
    float t = 0.0;
    float t2 = (length(mouse)+100.0 + time * 0.05);
    for (int n = 0; n < MAX_ITER; n++) 
    {
      t += t2 * (1.0 - (3.0 / float(n+1)));
  //  i = p + vec2(cos(t - i.x) + sin(t + i.y), sin(t - i.y) + cos(t + i.x));
      i.x = p.x + cos(t - i.x) + sin(t + i.y);
      i.y = p.y + sin(t - i.y) + cos(t + i.x);
      
      c += 1.0 / length(vec2(p.x / (sin(i.x+t) / inten), p.y / (cos(i.y+t) / inten)));
    }
    c /= MAX_ITER;
    c = 1.5 - sqrt(c);
  //  gl_FragColor = vec4(vec3(c*c*c*c), 1.0) + vec4(0.0, 0.3, 0.5, 1.0);
    gl_FragColor = vec4(vec3(c*c*c*c), 1.0);  
    gl_FragColor.add(vec4(0.0, 0.3, 0.5, 1.0));
  }
}
//--------------------------------------------------
// GLSL example: mouse color test
//   see http://glslsandbox.com/e#20086.0
//--------------------------------------------------
class demo20086 implements GLSLInterface 
{
  void _main() 
  {
    float mx = mouse.x / resolution.x;
    float my = mouse.y / resolution.y;
    gl_FragColor = vec4(vec3(mx, mx, my), mx);
  }
}
//--------------------------------------------------
// GLSL example: shadertoys new
//   see https://www.shadertoy.com/new
//--------------------------------------------------
class demoRGB implements GLSLInterface 
{
  void _main()
  {
    float rx = gl_FragCoord.x / resolution.x;
    float ry = gl_FragCoord.y / resolution.y;
    gl_FragColor = vec4(rx, ry, 0.5+0.5*sin(time*0.1), 1.0);
  }
}

/* Anpassung muß noch durchgeführt werden!!! */
//--------------------------------------------------
// GLSL example:     todo: NOT WORKING 
//   see http://glsl.heroku.com/e#9863.0
//--------------------------------------------------
class demo9863 implements GLSLInterface 
{
//vec2 conj(vec2 v) {return vec2(v.x,-v.y);}
//vec2 inv(vec2 v)  {return conj(v) / dot(v,v);
  vec2 inv(vec2 v)          { float dp = dot(v,v);   return vec2(v.x/dp, -v.y/dp); }
  
  vec2 mu(vec2 u, vec2 v)   { return vec2(u.x*v.x -u.y*v.y, u.x*v.y +u.y*v.x); }
  
//vec2 fonc(vec2 p,float t) {return inv(p-0.9*sin(t))*(2.0+cos(t))
//                                + inv(p+0.5*cos(t))*(2.0+sin(t)); }
  vec2 fonc(vec2 p,float t) { vec2 u=p.get();           vec2 v=p.get();         
                              u.add(-0.9*sin(t));       v.add(0.5*cos(t));
                              u = inv(u);               v = inv(u); 
                              u.mult(2.0+cos(t));       v.mult(2.0+sin(t));
                              u.add(v);
                              return u;  }
  
  float a = 0.3;
  float b = 5.28;
  float c = (b-a) / 2.0 + a;
  void _main()
  {    
    //# vec2 p = 8.0 * (gl_FragCoord.xy / resolution.xy) - 4.0;
    vec2 p = vec2 (2.0 * (gl_FragCoord.x / resolution.x) - 1.0,
                   2.0 * (gl_FragCoord.y / resolution.y) - 1.0);
    p.x *= resolution.x / resolution.y;

    float tempo = (sin (time*0.1 -1.57) +1.0) * c;  

    for(int i=0; i<6; i++)
    {
      //p = fonc(mu(p,p) +p +mouse.x, tempo);
      p = mu(p,p);
      p.add(p);
      p.add(mouse.x / resolution.x);
 //     p = fonc(p, tempo);
    }
    gl_FragColor = vec4(cos(sin(p.x) +sin(p.y)),
                        abs(tan(1.0 / (p.y+p.x))),
                        exp(1.0 / tan(p.y) +1.0 / tan(p.x)),
                        1.0);
//    if ((gl_FragCoord.x == 200) && (gl_FragCoord.y == 200)) 
//    println (p + "   " + gl_FragColor);
  }
}

//==========================================================
//
// file:  GLSL.pde          (OpenGL Shading Language)
//
// v1.0  2014-09-20  inital release
//
// This file contains a frame work and some classes 
// for running GLSL code under processing.
//
// Note: GLSL is much more faster than this simulations!
//
// For more information about GLSL see...
// english: http://en.wikipedia.org/wiki/OpenGL_Shading_Language
//          http://www.opengl.org/registry/doc/GLSLangSpec.4.40.pdf           
// german:  http://wiki.delphigl.com/index.php/Tutorial_glsl
//
//==========================================================

//---- global GLSL variables ----
float time;           // current time
vec2 mouse;           // mouse position
vec2 resolution;      // window width and heigth 
vec2 surfaceSize;     // size of the visible area of the virtual surface.
vec2 surfacePosition; // position of the current fragment on the virtual surface.
vec2 gl_FragCoord;    // pixel coordinates
vec4 gl_FragColor;    // pixel color 

//----------------------------------------------------------
// interface definition for different demos
//----------------------------------------------------------
interface GLSLInterface 
{ 
  void _main();
}

GLSLInterface GLSLdemo; 
//----------------------------------------------------------
// select current GLSL demo 
//----------------------------------------------------------
void selectDemo (int index)
{
  index = constrain(index, 0, demoCount-1);
  GLSLdemo = functions[index];
}
//------------------------
void initGLSL()
{
  mouse = new vec2();
  resolution = new vec2(width, height);
  surfaceSize = new vec2(width, height);
  surfacePosition = new vec2();
  gl_FragCoord = new vec2();
  gl_FragColor = new vec4(127.0);
}
//------------------------
void drawGLSL()
{
  //println ("drawGLSL: "+frameCount);
  if (!mousePressed) time += 1.0;
  mouse.set(mouseX, mouseY);
  
  int pixelOffset = 0;
  int w2 = width/2;
  int h2 = height/2;
  loadPixels();       // must call before using pixels[]
  for (int yi = 0; yi < width; yi++) 
  for (int xi = 0; xi < height; xi++)
  {
    gl_FragCoord.set(xi,yi);
    surfacePosition.set(w2 - xi, h2 - yi);
    //----------------------------------------
    GLSLdemo._main();     // call GLSL program 
    //----------------------------------------
    pixels[pixelOffset++] = gl_FragColor.toColor();
  }
  updatePixels(); // display picture 
}

//------------------------
// global classes
//------------------------
class vec2 extends PVector
{
  vec2()                       { super(0,0,0); }
  vec2(float f)                { super(f,f,0); }
  vec2(float x, float y)       { super(x,y,0); }
  vec2(vec2 v)                 { super(v.x, v.y, 0); }
  void set(float x, float y)   { this.x = x; this.y = y; }
  void add(float f)            { this.x += f; this.y += f; }
  vec2 get()                   { return new vec2(x,y); }
  float length()               { return mag(); }
}
vec2 vec2(vec2 v)              { return new vec2 (v); }
vec2 vec2(float f)             { return new vec2 (f); }
vec2 vec2(float x, float y)    { return new vec2 (x,y); }
float length(vec2 v)           { return v.mag(); }
float dot(vec2 u, vec2 v)      { return u.x*v.x + u.y*v.y; }
//------------------------
class vec3 extends PVector
{
  vec3()                              { super(0,0,0); }
  vec3(float f)                       { super(f,f,f); }
  vec3(float x, float y, float z)     { super(x,y,z); }
  vec3(vec3 v)                        { super(v.x, v.y, v.z); }
  vec3 get()                          { return new vec3(x,y,z); }
  float length()                      { return mag(); }
}
vec3 vec3(vec3 v)                     { return new vec3 (v); }
vec3 vec3(float f)                    { return new vec3 (f,f,f); }
vec3 vec3(float x, float y, float z)  { return new vec3 (x,y,z); }
float length(vec3 v)                  { return v.mag(); }
float dot(vec3 u, vec3 v)             { return u.x*v.x + u.y*v.y + u.z*v.z; } 

//------------------------
class vec4 extends PVector
{ float w;
  vec4()                              { super(0.0, 0.0, 0.0); this.w=1.0; }
  vec4(float f)                       { super(f,f,f); this.w=1.0; }
  vec4(vec4 v)                        { super(v.x, v.y, v.z); this.w=v.w; }
  vec4(vec3 v, float w)               { super(v.x, v.y, v.z); this.w=w; }
  vec4(float x, float y, float z, float w)  { super(x,y,z); this.w = w; }
  vec3 xyz()                          { return new vec3(this.x, this.y, this.z); }
  vec2 xy()                           { return new vec2(this.x, this.y); }
  color toColor()                     { return color(this.x*256, this.y*256, this.z*256); }
}
vec4 vec4(vec3 v, float w)            { return new vec4 (v,w); }
vec4 vec4(float x, float y, float z, float w)   { return new vec4 (x,y,z,w); }
float dot(vec4 u, vec4 v)             { return u.x*v.x + u.y*v.y + u.z*v.z + u.w*v.w; } 


