
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PFont ArialMT;
void setup(){
  size (800,600);
  background(0,0,0);
  a = loadImage("o.jpg");
  b = loadImage("1.png");
  c = loadImage("oquestion1.jpg");
  d = loadImage("1a.png");
  e = loadImage("ofinal.jpg");
  f = loadImage("projection2.jpg");
  g = loadImage("2a.png");
  h = loadImage("projection1.jpg");
  i = loadImage("oexc.jpg");
  String[] fontList = PFont.list();
  ArialMT = createFont("FFScala",20);
   image(b,0,267,width/1.8,height/1.8);
   textFont(ArialMT);
   text("Type the letters from a-f to see how the Interactive column works...",20,20);
   }
void draw(){
  if (keyPressed == true){
  if (key == 'a' || key == 'A'){
    background(0,0,0);
    image(b,0,267,width/1.8,height/1.8);
    textFont(ArialMT);
    text(" Smoker approaches the cigarette disposal column.", 50,50);
    image(a,380,100,340,500);
  }
    
 if (key == 'b' || key == 'B'){
      background(0,0,0);
      image(b,0,267,width/1.8,height/1.8);
      image(a,200,100,340,500);
       textFont(ArialMT);
      text(" Smoker reads the projected data on its sides while smoking.", 50,50);
 
 }
 if(key== 'c' || key =='C'){
    background(0,0,0);
    image(b,0,267,width/1.8,height/1.8);
    image(c,200,100,340,500);
    textFont(ArialMT);
    text("Smoker is surprised by the projections...",50,50);

 }
 if (key == 'd' || key == 'D'){
      background(0,0,0);
      image(d,0,267,width/1.8,height/1.8);
      image(e,200,100,340,500);
      image(f,600,140,100,400);
      textFont(ArialMT);
      text("As soon as the smoker disposes of their cigarette,onto the column's",50,50);
     text("touch sensitive surface, the projections change...",50,68);
 
 }
 if (key == 'e' || key == 'E'){
      background(0,0,0);
      image(g,0,267,width/1.8,height/1.8);
      image(i,200,100,340,500);
      image(h,600,140,100,400);
      textFont(ArialMT);
      text("Funny yet serious, anti-smoking, projections appear for a short time...",50,50);
 
 }
 if (key == 'f' || key == 'F'){
      background(0,0,0);
      image(b,0,267,width/1.8,height/1.8);
      image(e,600,100,220,350);
       textFont(ArialMT);
      text("Finally the projections finish and the smoker leaves...", 50,50);
    }
  }
  
}
 


