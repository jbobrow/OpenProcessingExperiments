

void setup(){
  size(600,600);
  background(0);
  
}

void draw(){
   
  int xpos = int(random(width)); //random position x of the star 
  int ypos = int(random(height));//random position y of the star
  float scalefactor = random(1,3);//a random scalefactor between 1 and 3
  
  fill(mouseX/600.0*random(255),mouseY/600.0*random(255),mouseX/600.0*random(255));//fill random color according to the mouse position
  drawStar(xpos,ypos,scalefactor);//draw the star using the xpos and ypos and the scalefactor
  
  
}

void drawStar(float posx, float posy,float scalefactor){//function used to draw star
  
     noStroke();
     
     quad(posx,posy,posx-8*scalefactor,posy+21*scalefactor,posx,posy+14*scalefactor,posx+8*scalefactor,posy+21*scalefactor);
     //drawing a quad used to make up a star according to the given start posx and posy
     triangle(posx,posy+14*scalefactor,posx-14*scalefactor,posy+7*scalefactor,posx+14*scalefactor,posy+7*scalefactor);
     //drawing a triangle to make up the rest of the start according the given start point posx and posy
     
     fill(255); //fill the next shape with white color
     beginShape();//begin drawing the shape -- It's a big star
     vertex(300,20);
     vertex(380,200);
     vertex(580,200);
     vertex(400,350);
     vertex(530,580);
     vertex(300,430);
     vertex(70,580);
     vertex(200,350);
     vertex(20,200);
     vertex(220,200);
     endShape();//end of the shape
}



