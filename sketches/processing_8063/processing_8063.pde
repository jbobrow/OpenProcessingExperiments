
//import processing.opengl.*;
import lsystem.*;    // library available on project kenai
import peasy.*;
float HALF = PI/360; // half a degree error
String axiom = "A";
String production;
float THETA = HALF_PI + HALF;
float PHI = HALF_PI - HALF;
PeasyCam cam;
Grammar grammar;
 
void setup()
{
  //size(600, 600, OPENGL);
  size(600, 600, P3D);
  //configureOpenGL();
  cam = new PeasyCam(this, -70,70,-70,250);
  cam.rotateX(PI/5);
  cam.rotateY(PI/5);
  noStroke();
  grammar = new SimpleGrammar(this, axiom);
  grammar.addRule('A', "B>F<CFC<F>D+F-D>F<1+CFC<F<B1^");
  grammar.addRule('B', "A+F-CFB-F-D1->F>D-1>F-B1>FC-F-A1^");
  grammar.addRule('C', "1>D-1>F-B>F<C-F-A1+FA+F-C<F<B-F-D1^");
  grammar.addRule('D', "1>CFB>F<B1>FA+F-A1+FB>F<B1>FC1^");
  production = grammar.createGrammar(3);
}
 
//void configureOpenGL(){
//  hint(ENABLE_OPENGL_4X_SMOOTH);
//  hint(DISABLE_OPENGL_ERROR_REPORT);
//}
  
public void draw()
{
  int repeats = 1;
  int col = color(0, 225, 0);
  lights();
  directionalLight(128, 128, 128, 0, 0, 1);
  background(0);
  CharacterIterator it = grammar.getIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch (ch) {
    case 'F':
      fill(col);
      float len = 20;
      translate(0, 0, -len / 2);
      box(3, 3, len - 1.6);     
      translate(0, 0, -len / 2);
      box(3, 3, 3);
      break;
    case '+':
      rotateX(THETA * repeats);
      repeats = 1;
      break;
    case '-':
      rotateX(-THETA * repeats);
      repeats = 1;
      break; 
    case '>':
      rotateY(THETA * repeats);
      repeats = 1;
      break;
    case '<':
      rotateY(-THETA * repeats);
      repeats = 1;
      break;
    case '^':
      rotateZ(PHI * repeats);
      repeats = 1;
      break;
    case '1':
      repeats += 1; 
    case 'A':
    case 'B':
    case 'C':
    case 'D':
      break;
    default:
      System.err.println("character " + ch + " not in grammar"); 
    }
  }
}


