
color[] palette=new color[20];
int trans;
int pupil1;
int pupil2;

  smooth();
  
  for(int i=0; i<20; i++)
    palette[i]=color(int(random(0,255)),int(random(0,255)),int(random(0,255)));

  size(1000,1000);
  noStroke();

  for(int i=1; i<11; i++){
    line(0,height/10*i,width,height/10*i);
    line(width/10*i,0,width/10*i,height);
  }
  
  pushMatrix();
  for(int i=0; i<10; i++){
    pushMatrix();
    
    for(int k=0; k<10; k++){
      fill(255);
      ellipse(int(random(18,22)),int(random(38,44)),10,10);
      
      fill(0);
      pupil1=int(random(1,9));
      pupil2=int(random(1,7));
      ellipse(20,41,pupil1,pupil1);
      
      fill(palette[int(random(palette.length))],int(random(50,100)));
      beginShape();
      vertex(13,52);
      curveVertex(13,52);
      curveVertex(17,44);
      curveVertex(23,38);
      curveVertex(32,32);
      curveVertex(39,31);
      curveVertex(43,31);
      curveVertex(51,32);
      curveVertex(58,36);
      curveVertex(67,49);
      vertex(67,49);
      curveVertex(67,49);
      curveVertex(67,41);
      curveVertex(69,36);
      curveVertex(72,31);
      curveVertex(76,27);
      curveVertex(82,25);
      curveVertex(87,25);
      vertex(87,25);
      curveVertex(87,25);
      curveVertex(89,29);
      curveVertex(90,35);
      curveVertex(90,42);
      curveVertex(88,48);
      curveVertex(85,50);
      curveVertex(82,52);
      vertex(82,52);
      curveVertex(82,52);
      curveVertex(84,55);
      curveVertex(86,58);
      curveVertex(90,63);
      curveVertex(91,71);
      curveVertex(90,75);
      curveVertex(87,80);
      vertex(87,80);
      curveVertex(87,80);
      curveVertex(83,79);
      curveVertex(79,77);
      curveVertex(72,72);
      curveVertex(68,66);
      curveVertex(67,61);
      curveVertex(67,57);
      vertex(67,57);
      curveVertex(67,57);
      curveVertex(63,60);
      curveVertex(58,64);
      curveVertex(53,67);
      curveVertex(49,69);
      curveVertex(40,71);
      curveVertex(29,68);
      curveVertex(22,64);
      curveVertex(17,59);
      curveVertex(13,52);
      endShape(CLOSE);
      
      fill(palette[int(random(palette.length))],int(random(50,100)));
      ellipse(44,50,7,6);
      fill(palette[int(random(palette.length))],int(random(50,100)));
      ellipse(44,56,7,6);
      fill(palette[int(random(palette.length))],int(random(50,100)));
      ellipse(44,62,7,6);
      fill(palette[int(random(palette.length))],int(random(50,100)));
      ellipse(38,53,7,6);
      fill(palette[int(random(palette.length))],int(random(50,100)));
      ellipse(38,56,7,6);
      
      fill(255);
      ellipse(33,42,15,15);
      
      fill(0);
      ellipse(int(random(30,36)),int(random(38,43)),pupil2,pupil2);
 
      translate(0,height/10);
    }
    popMatrix();
    translate(width/10,0);
  }
  popMatrix();

