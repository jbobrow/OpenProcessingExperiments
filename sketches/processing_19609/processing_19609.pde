
float angle=0.0;
void setup(){
  size(250,250);
  smooth();
  noStroke();
}
void draw(){
  fill(#FF0D0D,12);
  rect(0,0,width,height);
  fill(255,50);
  angle=angle+0.3;
  translate(125,125);
  rotate(angle);
  ellipse(-50,-50,60,80); 
   rect(-50,-50,10,60);   
  ellipse(-10,-10,70,70);
    fill(0,50);
     ellipse(-30,-30,10,60); 
        ellipse(-30,-30,10,10);   
              ellipse(-30,-30,10,90); 
          angle=angle+0.5;      
  strokeWeight(4);
  stroke(255,80);
    line(-10,-10,70,70);
      strokeWeight(2);
          line(-10,-10,100,100);
                strokeWeight(0.5);
                    line(-10,-10,120,120);
                      translate(100,100);
                      noStroke();
                          fill(#C6E53F,50);
                        rect(-10,-10,70,70);
                        rect(-50,-50,50,50);
                                              translate(150,150);
                                               rect(-10,-10,70,70);
                        rect(-50,-50,50,50);
                      
}


