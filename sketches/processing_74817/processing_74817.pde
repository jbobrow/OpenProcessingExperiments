
Grid myGrid01;  
Grid myGrid02;   
Grid myGrid03;  
Grid myGrid04;  
Grid myGrid05;  

   

void setup() {  
  size(800,400);  
  myGrid01 = new Grid(0, 0);   
  myGrid02 = new Grid(0, random(0,100));  
  myGrid03 = new Grid(0, random(100,200));  
  myGrid04 = new Grid(0, random(200,300));  
  myGrid05 = new Grid(0,random(300,400));   
  smooth(); 
  background(0); 
}  

    

void draw() {  
  //background(255);  
  myGrid01.move();  
  myGrid01.display();  
  myGrid02.move();  
  myGrid02.display();  
  myGrid03.move();  
  myGrid03.display();  
  myGrid04.move();  
  myGrid04.display();  
  myGrid05.move();  
  myGrid05.display();  
}  

   


