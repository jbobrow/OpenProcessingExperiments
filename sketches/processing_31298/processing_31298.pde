
float x = width/2;
float y = height/2;
float dia = 50;
float radius = dia/2;
color col = color(200);


void setup() {  //setup function called initially, only once
  size(500,500);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 
  fill(col);
  ellipse(x,y,dia,dia);
  
 
  if(mousePressed == true) { //add some interaction
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    col = color(200,100,30);//do your thing
    }
    }
    }

                
                
