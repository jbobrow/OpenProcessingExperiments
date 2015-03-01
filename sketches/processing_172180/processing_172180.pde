
PImage mideum;
PImage jaeok;
PImage ayong;
PImage kyuchan;
int ddlab;
int workshop;
int processing;
int fun;
float interesting;





void setup() {
  
  size (600, 849);
  String url = "http://ayplus.cafe24.com/ayong/ddl/";
  ayong = loadImage("111.png");
  kyuchan = loadImage("9.png");
  mideum = loadImage("456.png");
  jaeok = loadImage("789.png");
  
  ddlab = 0;
  workshop = 0;
  processing = 0;
  fun = 0;
  interesting = 0.0;
  
}

void draw() {
 
  
   ddlab=ddlab+4;
   workshop = workshop+8;
   processing = processing+1;
   fun = fun+5;
   
   if(ddlab > height){
    ddlab = ddlab * -1;
    }
    
    if(workshop > width){
    workshop = workshop * -1;
    }
    
    if(processing > width){
    processing = processing * -1;
    }
    
    if(fun > width){
    fun = fun * -1;
    }
    

   
    
 //ddlab
 
   background(mouseX, 24, mouseY);
   noStroke();
   fill(mouseX, mouseX + mouseY, mouseY);
   rect(19,19,165,58,30,30,0,0);
   rect(19,77,116,136);
   rect(19,213,165,63,0,0,30,30);
   rect(203,19,88,257,30,30,30,30);
   
   rect(312,19,163,58,30,30,0,0);
   rect(312,77,112,136);
   rect(312,213,163,63,0,0,30,30);
   rect(495,19,88,257,30,30,30,30);
   
   rect(19,295,165,90,30,30,0,0);
   rect(140,385,44,97);
   rect(19,482,165,122,30,0,30,0);
   rect(19,604,46,129);
   rect(19,733,165,92,0,0,30,30);
   
   rect(203,295,162,260,30,30,30,30);
   rect(365,378,57,99);
   rect(422,295,161,260,30,30,30,30);
   
   rect(203,568,162,54,30,30,0,0);
   rect(422,568,161,54,30,30,0,0);
   rect(203,622,380,71);
   rect(203,693,162,132);
   rect(422,693,161,132);
   rect(203,752,380,73);
   

   
   
  
  //date
  
   image(mideum, 0, processing);
   image(kyuchan, 0, ddlab);
   image(ayong, workshop, 0);
   image(jaeok, fun, 0);
   
   println();
   println("mouseX = " + mouseX);
   println("mouseY = " + mouseY);
   





}


