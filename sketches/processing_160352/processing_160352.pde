
String texto = "U M  P O V O  C O N S C I E N T E  É  O  M A I O R  M E D O  D E  U M  G O V E R N O  M A L  I N T E N C I O N A D O  U M  P O V O  C O N S C I E N T E  É  O  M A I O R  M E D O  D E  U M  G O V E R N O  M A L  I N T E N C I O N A D O  U M  P O V O  C O N S C I E N T E  É  O  M A I O R  M E D O  D E  U M  G O V E R N O  M A L   I N T E N C I O N A D O  ";
            float x, y, x2=width/2, y2=height/2, r=6;
            PFont font;
            int cont = 0;
            float arclength, angulo, w;
             
            void setup() {
              size(500, 600);
              font = loadFont("fuente.vlw");
              noLoop();
            }
            void draw() {
              background(0);
              fill(255);
              arclength = 1;
              translate(width/2,height/2);
              for (float i=0 ; cont<texto.length() ; i+=0.1) {
                w = textWidth(texto.charAt(cont)+" ");
                arclength += w/2;
                angulo = PI + (arclength / (r*i));
                x = (r*i) * cos(angulo);
                y = (r*i) * sin(angulo);
                textFont(font, 1*i);
                pushMatrix();
                scale();
                translate(x,y);
                rotate(angulo  + PI/2);
                text(texto.charAt(cont), 0, 0);
                popMatrix();
                arclength += w/2;
                x2 = x;
                y2 = y;
                cont++;
              }
            }
