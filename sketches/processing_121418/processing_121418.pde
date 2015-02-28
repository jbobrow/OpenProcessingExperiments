
int eSize = 30;  //円の直径
 
size(565, 400);  
background(255);  
smooth();  
 
for(int x = 0; x <= width; x += 25){
 
  if(x == width/2){  
    fill(255);  
  }
  else{    
    fill(0);  
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);  
}

stroke(255);   
strokeWeight(40);  
line(300, 0, 249, 285.25);    


noStroke();     //線を描かない
fill(1);
ellipse(285.25, 200, 250, 250);     //円の描画

stroke(255);   
strokeWeight(40);  
line(300, 0, 274, 200);    


noStroke();     //線を描かない
fill(255);
ellipse(285.25, 200, 150, 150);     //円の描画
/*
noStroke();     //線を描かない
fill(255);
triangle(285.25,200,170,70,110,140);


noStroke();     //線を描かない
fill(255);
triangle(285.25,200,395,340,465,230);
*/


stroke(255);  //線を描かない
strokeWeight(10);
fill(255,0,0);
triangle(285.25,200,170,80,110,140);


stroke(255);     //線を描かない
strokeWeight(10);
fill(255,0,0);
triangle(285.25,200,395,340,465,230);


stroke(0);     
strokeWeight(20);     
line(0, 70, 565, 30);     

stroke(0,0,0);   
strokeWeight(20);  
line(30, 0, 75, 400);    

stroke(255,0,0);   
strokeWeight(20);  
line(300, 0, 249, 400);   

stroke(0);     
strokeWeight(20);     
line(0, 321, 565, 351);     



stroke(255,0,0);   
strokeWeight(20);  
line(700,165 , 321, 400);    



 




