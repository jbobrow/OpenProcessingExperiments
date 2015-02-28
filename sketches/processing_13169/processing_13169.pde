

	
void setup(){
  size(400,400);
  background(255,225,0);
  smooth();
}



void draw(){
 
  println("x: "+ mouseX+"; y:"+mouseY);

   background(255,225,0);
   stroke(0);
   strokeWeight(1);


    for(int i = 200; i < width ; i+=20)
      for(int j = 10; j < 100; j+=45){
        beginShape();
        noFill();
        curveVertex(i-2,j+20);
        curveVertex(i,j);
        curveVertex(i+3,j-10);
        curveVertex(i+20,j+45);
        curveVertex(i+30,j+25);
        endShape();
        strokeWeight(2);
       
       }
      
     for(int i=0; i< width/2 ; i+=20)
       for(int j = 10; j < 100; j+=45){
        beginShape();
        curveVertex(i+2,j+20);
        curveVertex(i,j);
        curveVertex(i-3,j-10);
        curveVertex(i-20,j+45);
        curveVertex(i-30,j+25);
        endShape();
        strokeWeight(2);
       noFill();
       }
       
       
       /** 
     fill(0);
     noStroke();   
     ellipse(100,180,30,30);
     ellipse(300,180,30,30);
     
     beginShape();
     if(mouseX>150 && mouseX<250)
     fill(255,0,0);
     else 
     fill(0);
     vertex(150,300);
     vertex(250,300);
     vertex(200,350);
     endShape();
     noFill();
     */
     
  // if( (mouseX>80 && mouseY>150) && (mouseX<180 && mouseY<200) )
     
     beginShape();
     fill(0);
     pushMatrix();
    translate(160,70);
    scale(0.7,0.7);
    
vertex(120.0, 166.0);
bezierVertex(124.0, 137.0, 258.0, 111.0, 265.0, 117.0);
bezierVertex(272.0, 123.0, 221.0, 168.0, 201.0, 176.0);
bezierVertex(181.0, 184.0, 139.0, 175.0, 121.0, 167.0);


endShape();


// if( (mouseX>240 && mouseY>150) && (mouseX<350 && mouseY<200) )

   beginShape();
     fill(0);
//    translate(-200,10);
    pushMatrix();
scale(-1, 1);    
translate(-150, 10);
vertex(120.0, 166.0);
bezierVertex(124.0, 137.0, 258.0, 111.0, 265.0, 117.0);
bezierVertex(272.0, 123.0, 221.0, 168.0, 201.0, 176.0);
bezierVertex(181.0, 184.0, 139.0, 175.0, 121.0, 167.0);
endShape();

popMatrix();     
popMatrix();     
     
     
     
    if( (mouseX>170 && mouseY>300) && (mouseX<250 && mouseY<340) ){
      
    
      for(int r=150; r<270; r+=10)
        for(int s=300; s<340; s+=20){
       noFill();       
       rect(r,s,20,20);
       }
     }
     
     
      else {
        strokeWeight(5);
        line(170,320,250,320);
      }
     
     
      if( mouseY>150 &&  mouseY<200 ){
        fill(255,0,0);
        ellipse(135,185,20,20);
        ellipse(295,180,20,20);
        }
        
        
        
        if(mousePressed){ 
          for(int r=90; r<320; r+=10)
        for(int s=300; s<340; s+=20){
       noFill();       
       strokeWeight(2);
       rect(r,s,20,20);
       fill(255,0,0);
        ellipse(135,185,40,40);
        ellipse(295,180,40,40);
        strokeWeight(1);
        ellipse(135,185,20,20);
        ellipse(295,180,20,20);
         }
        }
  
  
    //line(mouseX, mouseY, 100, 100);
    //println(mouseX + " ; " +mouseY);
    /**
    if ( (pmouseX > i && pmouseY > j) && (pmouseX < i+10 && pmouseY< j+10))
      stroke(255,255,0);
      
    else
      stroke(0);
      }
     
      if ( (pmouseX > 50 && pmouseY > 50) && (pmouseX < 100 && pmouseY< 100)){
         fill(255,255,0); 
        ellipse (50,50,10,10);  
        
      }
      else{
        fill(0); 
        ellipse (50,50,70,70); */
      
     
   
}


