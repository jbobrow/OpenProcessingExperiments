
float ubicacionX, ubicacionY;

void setup (){

  size(400 , 400); 
}
void draw(){
    background (0);  
    strokeWeight(2);
    
     line (mouseX,mouseY, 150,158);
     line (mouseX,mouseY, 152,160);
     line (mouseX,mouseY, 154,164);

       
    stroke (255,0,255);
          line (270,170, mouseX+400,mouseY);
          stroke (0,0,255);
        line (266,166, mouseX+400,mouseY); 
                 stroke (0,255,255);
        line (262,162, mouseX+400,mouseY);
       stroke (0,255,0);
      line (258,158, mouseX+400,mouseY);
       stroke (255,255,0);
    line ( 254,154, mouseX+400,mouseY);
    stroke (255,150,0);
  line (250,150, mouseX+400,mouseY);
  stroke (255,0,0);
        line (250,146, mouseX+400,mouseY);
  
  strokeWeight(3);
stroke(255);
fill(0); 
  triangle (100,200,200,100,300,200);
  
  ubicacionX = mouseX;
  ubicacionY = mouseY;
  
  //println( "en x="+ubicacionX ) ;
 // println( "en y="+ubicacionY ) ;


  
 
}

