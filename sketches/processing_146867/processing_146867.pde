
 // Tweak based on  fractal tree recursive L-System by Jan Pernecky
 // changed Parameters, basic shape and Grammar
 // replaced dependency of mouseX by time, to obtain a constantly moving curly tree shape
 // AW 2.5.14
 
  int levelsMin = 2;
  int levelsMax = 7;
  float initialLength = 20;

  float angleMin = radians(15);
  float angleMax = radians(50);

  int pointColor = color(27, 25, 9); 
  
  String recursiveFractalPlant(int levels, String sentence) {  //prepare rules for the turtle graphics
//    http://en.wikipedia.org/wiki/L-system
//    variables : X F
//    constants : + - [ ]
//    start  : X
//    rules  : (X -> F-[[X]+X]+F[+FX]-X), (F -> FF)
//    angle  : 25Ã�Â°

    String next = "";
    if (levels > 0) { // check if there are any levels left to render
      char[] characters = sentence.toCharArray();
      for (char c : characters) {
        switch (c) {  //interprets the rules derived from the nature
        case 'X':
          next+=recursiveFractalPlant(levels-1, "F-F+F-F+X-[[X]+X]+F[+FX]-X");
          break;
        case 'F': 
          next+=recursiveFractalPlant(levels-1, "FF");
          break;
        default:
          next+=String.fromCharCode(c);  //only works in JavScript mode!
       // next+=c;                       //only works in Java mode!
          break;
        }
      }
    }else{
      next=sentence;
    }
    return next;
  }
  
  void drawFractalPlant(float length, float angle,  String sentence){  //draw turtle graphics
//    http://en.wikipedia.org/wiki/L-system
//    variables : X F
//    constants : + - [ ]
//    angle  : 25Ã�Â°
//    Here, F means "draw forward", - means "turn left 25Ã�Â°", and + means "turn right 25Ã�Â°". 
//    X does not correspond to any drawing action and is used to control the evolution of the curve. 
//    [ corresponds to saving the current values for position and angle, which are restored when 
//    the corresponding ] is executed.
      char[] characters = sentence.toCharArray();
       
      for (char c : characters) {
        switch (c) {  //interprets the rules derived from the nature
        case '-':
          rotate(angle);
          break;
        case '+':
          rotate(-angle);
          break;
        case '[':
          pushMatrix();
          break;
        case ']':
          popMatrix();
          break;
        case 'F':
       // noStroke(); 
       stroke(0, 128, 0, 60); // TRANSPARENTES GRUEN
       noFill();  
     
        rect  (0, 0, 3*length,  3*length);
        //  line(0, 0, 0, -length); // draw line "forwards"
          translate(0,-length); // move the origin to the branch end
          break;
        }
      }
  }  

  public void setup() {
    size(800, 800, P2D);
    stroke(pointColor);
    strokeWeight(1);
  }

  public void draw() {
    background(color(245, 247, 232));

    float currentAngle = map(second(), 0, 60, angleMin, angleMax); // mouse control of the generations count
    int currentLevels = (int) map(mouseY, height, 0, levelsMin, levelsMax); // mouse control of the generations count
    float currentLength =  map(mouseY%(height/currentLevels), height/currentLevels, 0, initialLength/(currentLevels+1), initialLength/(currentLevels)); // mouse control of the generations count

    pushMatrix(); // save the world transformation matrix
    translate(width/2,height); // move the origin to the middle / bottom
    String rules = recursiveFractalPlant(currentLevels, "X");  //create rules for turtle graphics
    drawFractalPlant (currentLength, currentAngle, rules);    //draw turtle graphics
    popMatrix(); // return to the world coordinate system
  }
