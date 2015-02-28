
   void setup(){
  
 smooth();
 background(255);
 
   
 size(600,600);
 noStroke(); 
 
 
for(int y =0; y <=height; y+= 53){  

   for(int x = 0; x<= width; x+= 53){  

      fill(#99DCE1);  

       ellipse(x, y, 50, 50);} }  

   }


void draw() {
  
  smooth();
if(keyPressed) {
if (key == 'c' || key == 'C') {
  
for(int y =0; y <=height; y+= 53){  

   for(int x = 0; x<= width; x+= 53){  

      fill(#FDABF6);  

       ellipse(x, y, 50, 50);} }  

   }


} else {
  smooth();
fill(255);
}
ellipse(0,0, 50, 50);




   

//Sasun  


fill(#D972B6);

quad(200,600,600,400,600,500,400,600);  

   

   

   

   

noFill();  

stroke(140);  

strokeWeight(5);  

   

   

//Rect Group  

stroke(#904C78);

strokeWeight(3);  

   

     

     

//linewith    




line(0,560,339,300);  

line(513,300,750,600);  

   

   

strokeWeight(2);  

rect(320,210,205,105);  

   

   

strokeWeight(6);  

rect(260,150,295,210);  

   

   

strokeWeight(15);  

rect(160,100,450,325);  

   

stroke(#AA5A8E);  

   

strokeWeight(25);  

rect(20,20,610,525);  

   

   

   

//Giatnt circle  

   

//a  

stroke(#C898EE);  

strokeWeight(40);  

ellipse(50,100,500,500);  

   

//b  

stroke(#D8B7FB);  

ellipse(50,100,200,200);  

   

//c  

stroke(220);  

strokeWeight(20);  

ellipse(50,50,1200,1200);  

   

   

   

   

   

//Mid Rect  

   

noStroke();  

   

   

quad(50,400,170,360,200,430,70,470);  

fill(#572C4F);  

   

rect(335,225,180,80);  

   

   

   

   

//whabun  

fill(#81628B);  

noStroke();  

//click Cx2 to make arrange behind
   float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
float diameter = speed * 3.0;
ellipse(230,200, diameter/2, diameter/2);





   

   

   

//Donglami  

fill(150);  

ellipse(480,370,40,40);  

   

   

//Doglami2  

   

fill(150);  

ellipse(450,350,10,10);  

   

 

   

 

   

   

   

   


   

   

fill(#F6B9E4);  

quad(350,480,430,350,565,600,430,600);  

quad(300,550,330,510,390,600,340,600);  

   
   

   
   
   //geumul

//don3  

   

fill(#68345E);  

ellipse(400,470,50,60); 
//are Rect  


}

                                                
