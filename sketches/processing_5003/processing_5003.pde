
int x, y;

void setup() {
  size(600,600);
  smooth();
  }

void draw() {
  background(116, 193, 206);
  
  if(keyPressed) {
    if(key == 'f'){                 //fly 
   x-=4;                           //variables  x = x-4
  y-=4;                           //variables y = y-4
    }
     if(key == 'r'){              //return
          x+=4;                  //x = x+4
  y+=4;                          //y = y+4
     }
  }
  translate(x,y);                //makes it happen 
  if (mousePressed) {     
  quad(301, 190, 208, 252, 205, 320, 360, 245);  //main wing
  quad(405, 315, 258, 426, 344, 445, 410, 362); //bottom wing
 
  triangle(51, 273, 0, 320, 72,290); //head
  quad(205, 320, 360, 245, 405, 315, 258, 426); //body
   triangle(50, 273, 270, 340, 260, 425); //neck
  triangle(205, 320, 280, 275, 270, 340); //middle small
  triangle(280, 274, 258, 426, 405, 315); //middle large
  triangle(485, 130, 360, 245, 405, 315); //tail
  
    
  } else {
   
     quad(360, 245, 205, 320, 258, 426,405, 315); //body
     
  triangle(230, 120, 205, 320, 360, 245);  //main wing
  triangle(50, 273, 270, 340, 260, 425); //neck
  triangle(51, 273, 0, 320, 72,290); //head
  
  
  triangle(205, 320, 280, 275, 270, 340); //middle small
  
  triangle(280, 274, 258, 426, 405, 315); //middle large
  triangle(485, 130, 360, 245, 405, 315); //tail
  triangle (405, 315, 258, 426, 450, 460); //bottom wing
  }

 
}




