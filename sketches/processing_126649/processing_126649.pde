
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;

void setup(){ 
  
    size(500,500);
    monsterY=200;
    richting=10;
    test=false; 
} 


void draw(){ 
  
if(test==false){
    background(255);
}
if(test==true){
    background(255,0,0);
} 
    
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
if(test==false){
    fill(255);
}
if(test==true){
    fill(255,0,0);
}
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,30,30); 
    ellipse(monsterX+55,monsterY,30,30); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,25,25); 
    ellipse(monsterX+55,monsterY,25,25); 

    noStroke(); 
if(test==false){
    fill(255);
}
if(test==true){
    fill(255,0,0);
} 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,20,20); 
    ellipse(monsterX+55,monsterY,20,20); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,15,15); 
    ellipse(monsterX+55,monsterY,15,15); 

    noStroke(); 
if(test==false){
    fill(255);
}
if(test==true){
    fill(255,0,0);
} 
    ellipseMode(CENTER); 
    ellipse(monsterX-25,monsterY,10,10); 
    ellipse(monsterX+55,monsterY,10,10); 


if(monsterY > height) {
 richting = -richting;
 teller=teller+1;
}

if(monsterY < 0) {
 richting = -richting;
 teller=teller+1;
}

if(teller==10){
  teller=0;
  test=!test;
}

println(teller);
monsterY= monsterY + richting;
monsterX= mouseX;

}
