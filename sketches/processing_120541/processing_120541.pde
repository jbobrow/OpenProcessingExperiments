
size(400,565);

background(255);



noStroke();

fill(31,30,71);
rect(150, 480, 150, 10); 


fill(188,189,194);
rect(250, 10, 50, 330); 

rect(180, 340,70, 100); 

rect(150, 440, 30, 120); 



fill(249,37,00);
rect(50, 160, 100, 140); 


stroke(0);

line(50, 0, 50, 565);

line(0, 160, 400, 160);




for(int x=0; x<=width; x++){

 stroke(x,0,0,50);
  line(width,160,x,height);
}






