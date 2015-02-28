
float margin, space;   

void setup(){   

margin = 10;   

space = 20;   

size(250, 400);   

stroke(1);   


}  

void draw(){   

background(250);   

fill(2);   

for(float y =margin; y <= height-margin; y += space){   

for(float x = margin; x <= width-margin; x += space){   

float d;   

d= sqrt((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y));    

stroke(1000);   
 
rect(x, y , 100/d, 100/d);

fill(mouseX-50, mouseY-50, 0, 125);   


    }   

    

  }  

    

} 


