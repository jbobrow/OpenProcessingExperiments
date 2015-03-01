
PFont font;
                Circulo novoCirculo;
                             
                void setup() {
                  size(500, 600);
                  
                  novoCirculo = new Circulo(width/2, height/2, 62);
                  
                  font = createFont("Arial", 30, true);
                  background(0);
                  smooth();
                  textFont(font);
                  textAlign(CENTER);
                  strokeWeight(1);
                  noLoop();
                  
                }
                 class Circulo{
                  String texto;
                  float larg;
                  float rot;
                  int posX, posY;
                  
                  Circulo (int _posX, int _posY, float _rot){
                    posX = _posX;
                    posY = _posY;    
                    larg = 40;
                    rot = _rot;
                  
                  }


                String desenhaCirculo(String texto){
                  translate(posX, posY);
                  noFill();
                  noStroke();
                  ellipse(0, 0, rot*2, rot*2);  
                 
                  float arcLength = 0;
                 

                  float totalAngle = textWidth(texto) / rot;

                  for (int i = 0; i < texto.length();i++) {

                    char currentChar = texto.charAt(i);
                    float larg = textWidth(currentChar);

                    arcLength += larg/2;
                 
                    float theta = arcLength / rot - totalAngle/2;
                 
                    pushMatrix();
                    rotate(theta);
                    translate(0, -rot);
                    fill(255);
                    text(currentChar, 0, 0);
                    popMatrix();
                    arcLength += larg/2;
                  }
                  
                  return texto;
                }
                 

                }
                 
                void draw() {

                  novoCirculo.desenhaCirculo("O BRASIL ACORDOOOOOU"); 
                 
                }
