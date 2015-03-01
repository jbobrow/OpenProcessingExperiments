

boolean renderpass1 = true;
void setup() {
 size(600,600);

colorMode(HSB, 210, 100, 100);
background(230,40,120);
 
}
 
void draw() {
   if(renderpass1){
      
     for (int i = 0; i <=884; i = i+1) {
       int point1x = int(random(0,width));
      int point1y = int(random(0,height));
     strokeWeight(0.5);
    
     line(width/4,height/4, point1x,point1y);
     stroke((point1y/(height/200)),(point1x/(width/300)+(point1y/(height/100))/2),100);
    
   }
     ellipseMode(CENTER);
     noStroke();
     fill(70,210,120);
    ellipse(width/4,height/4,20,20);  
     ellipse(width/2,height/2,10,10);
      ellipse(width/6,height/6,10,10);
      ellipse(160,20,20,20);
      ellipse(400,400,30,30);
      ellipse(300,540,40,40);
      ellipse(250,470,20,20);
      ellipse(200,400,10,10);
      ellipse(120,450,10,10);
      ellipse(90,310,10,10);
      ellipse(500,290,40,40);
      ellipse(350,320,20,20);
      ellipse(40,400,20,20);
      ellipse(50,240,10,10);
      ellipse(70,340,10,10);
      
       ellipse(100,20,20,20);
      ellipse(20,100,10,10);
      ellipse(30,500,40,40);
      ellipse(60,200,40,40);
      ellipse(35,120,10,10);
      ellipse(450,400,10,10);
      ellipse(550,240,10,10);
      ellipse(170,340,10,10);
      ellipse(460,20,10,10);
      
      ellipse(560,60,20,20);
      ellipse(400,30,10,10);
      ellipse(300,40,10,10);
      ellipse(500,70,20,20);
      ellipse(450,450,10,10);
      ellipse(400,400,10,10);
      ellipse(510,240,15,15);
      ellipse(70,340,10,10);
      
       ellipse(360,120,20,20);
      ellipse(300,270,30,30);
      ellipse(150,200,20,20);
      ellipse(500,500,10,10);
      ellipse(400,400,20,20);
      ellipse(450,300,20,20);
      ellipse(250,240,10,10);
      ellipse(270,340,10,10);
       ellipse(390,260,10,10);
      
      
      
      
     
     
   }
     
  
   
  renderpass1 = false;
}






