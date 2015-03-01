
size(600,300);
background(RGB);

for(int r=0; r<=600; r+=5){
  for(int h=0; h<=600; h+=5){
    noStroke();
    fill(r,r,0,40);
    ellipse(r,h,30,30);
  }
}

for(int y=0; y<=300; y+=20){
  for(int x=0; x<=300; x+=20){
    fill(250,255,0);
    ellipse(x,y,5,5);    
   noFill();
    stroke(y,y,0,40);
    quad(y,300,400,300,x,600,600,y);
    quad(x,0,0,0,600,x,y,600);   


  }
}

for(int m=300; m<=600; m+=20){
  for(int n=300; n<=600; n+=20){
    fill(0,0,0);
    ellipse(random(300,n),random(m),5,5);      
    noFill();
    stroke(m,n,0);
    ellipse(600,n,500,500);
    ellipse(600,300-m,500,500);
  }
}

for(int i=300; i<=600; i+=40){
  for(int k=300; k<=600; k+=40){
      noFill();
    stroke(0,0,0,80);
    ellipse(random(400,i),random(k),100,100);
    ellipse(random(400,k),random(i),random(10,50),random(10,50));
  }
}


