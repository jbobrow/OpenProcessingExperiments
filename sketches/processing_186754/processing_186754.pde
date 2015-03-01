
int counter;

void setup() {  //setup function called initially, only once
  size(500, 400);
  background(200,0,45);  //set background white
 
    
}

void draw() { 
  noStroke();
 if(mousePressed==true){
 background(random(205),random(90),random(255));
    }
    else{
    background()
    }
     fill(200,100,30)
  ellipse(250,200,400,400);

    if(mousePressed==true){
     fill(random(25),random(180),random(255));
    ellipse(width/2+100,200,100,50);
    ellipse(width/2-100,200,100,50);
    
    fill(random(100));
ellipse(width/2+100,190,20,20);


ellipse(width/2-100,190,20,20);


fill(1);
ellipse(width/2,height/2+100,30,45);
}
else{
fill(200)
ellipse(width/2+100,200,100,50);
ellipse(width/2-100,200,100,50);
fill(1);
ellipse(width/2+100,200,20,20);
ellipse(width/2-100,200,20,20);
}

}
