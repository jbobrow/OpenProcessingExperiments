
void setup()  

{  
 size(200, 200);  

}  

 void draw()  

{  

 background(0);  
 fill(255);  
 rect(20, 0, width - 40, height - 20);  
if(mouseX < 20 || mouseX > width - 20 || mouseY > height - 20)  

  {  

    float [] posX = {random(200), random(200), random(200), random(200), random(200)};  
    fill(150,30,20);  
    ellipseMode(CENTER);  
    ellipse(posX[0], width/2, 20, 20);  
    fill(30,250,0);  
    ellipse(posX[1], width/3, 20, 40);  
    fill(100,20,500);  
    rect(posX[2], width/4, 35, 25);  
    fill(0,0,255);  
    rect(posX[3], width/5, 55, 50);  
    rect(posX[4], width/3, 20, 20);  

  }
}
