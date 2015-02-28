
size(500,500);
background(255);
smooth();



noFill();
        strokeWeight(21);



for(int i=-10; i<550; i=i+30){
  for(int j=-20; j<550; j=j+20){
    
 //   stroke(#FF3700,70);
//point(j,i);

        stroke(#00ECFF,60);
//point(250+i,250+j);
//ellipse(250,250,i+50,i+50);
quad(i,j,i+10,j+10,i+20,j+20,i+30,j+30);

//  rectMode(CENTER);
//    rect(250,250,i+50,i+50);
//line(250,250,i,j);


    
  }
}
  
  


