
int monsterX;
int monsterY;

void setup(){ 
  
      size(500,500);
     monsterY=550; 
} 


void draw(){ 
    background(255); 
    
    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX,monsterY,160,160); 
    
    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX-45,monsterY-55,80,80); 
    ellipse(monsterX-70,monsterY-25,50,50); 
    ellipse(monsterX-70,monsterY-5,45,45); 
    ellipse(monsterX-70,monsterY+15,45,45); 
    ellipse(monsterX-60,monsterY+45,60,60); 
    ellipse(monsterX-30,monsterY+75,60,60); 
    ellipse(monsterX-5,monsterY+65,60,60); 
    ellipse(monsterX+25,monsterY+65,60,60); 
    ellipse(monsterX+45,monsterY+65,60,60); 
    ellipse(monsterX+65,monsterY+65,60,60); 
    ellipse(monsterX+75,monsterY+75,70,70); 
    ellipse(monsterX+65,monsterY+45,60,60); 
    ellipse(monsterX+70,monsterY+15,50,50); 
    ellipse(monsterX+50,monsterY-5,100,100); 
    ellipse(monsterX+50,monsterY-45,80,80); 
    ellipse(monsterX+75,monsterY-65,60,60); 
    ellipse(monsterX+95,monsterY-65,60,60); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,30,30); 
    ellipse(monsterX+55,monsterY,30,30); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,25,25); 
    ellipse(monsterX+55,monsterY,25,25); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,20,20); 
    ellipse(monsterX+55,monsterY,20,20); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,15,15); 
    ellipse(monsterX+55,monsterY,15,15); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,10,10); 
    ellipse(monsterX+55,monsterY,10,10); 


monsterX = mouseX;
monsterY = monsterY - 1;
} 

