
float radius = 10;
int x = 200;
int y = 200;
float speed = 3;
PFont font;

void setup(){
  background(0);
  size(400, 400);
font = loadFont("HannotateSC-W7-36.vlw");
  textFont(font);
  
  noStroke();
  ellipseMode(RADIUS);
 

    }
 


void draw(){
 radius+=speed;
 fill(0, 0, 255, 5);
    if (radius >= 400){
       radius=0;
       fill(0, 0, 255, 10);
       
    }
    if(radius <= 350){
      fill(255, 0, 0, 5);
    }  
  
    
    ellipse(x, y, radius, radius);
    
    if(mousePressed){
  fill(255, 5);
    }
    ellipse(x, y, radius, radius);
    if(keyPressed){
      if((key=='m')||(key=='M')){
        fill(255);
        text("As you read this...", 30, 50);
        
      }else if(key==CODED){
        if(keyCode==RIGHT){
          fill(255);
          text("I am in Hawaii...", 30, 50);
          
        }else if(keyCode==DOWN){
           fill(255);
          text("and you are not.", 30, 50);
        }else if(keyCode==LEFT){
          fill(255);
          
         text(" :-P", 170, 220); 
      }
      }  
    }
}
  
  
       
      

  



  



    



