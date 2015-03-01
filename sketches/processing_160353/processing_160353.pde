
PFont a;
 
                void setup(){
                size(500,600);
                 
                String[] fontList = PFont.list();
                for(int i = 0; i < fontList.length; i++){
                //println(i + "\t" + fontList[i]);
                 
                }
                 
                a = createFont("Veranda", 32);
                 
                }
                void draw(){
                  background(0);
                  textFont(a, 48);
                  text("COPA", mouseX, mouseY);
                  textFont(a, 24);
                  text("copa", mouseY, height/2+50);
                  textFont(a, 48);
                  text("PRA QUEM?", mouseX, height/2);
                  textFont(a, 24);
                  text("pra quem?", mouseY, mouseY);
                }
