
boolean renderpass1 = true;




void setup() {
 size(800,800);
 noSmooth();
colorMode(HSB, 360, 100, 100);
background(255,100,0);

}

void draw() {
   if(renderpass1){ 
     
     for (int i = 0; i <=884; i = i+1) {
       int point1x = int(random(1,width));
      int point1y = int(random(0,height));
     strokeWeight(1);
   
     line(width/2,height/2, point1x,point1y);
     stroke((point1y/(height/100)),(point1x/(width/100)+(point1y/(height/100))/2),100);
     

       
       
               
        
      
     }
     ellipseMode(CENTER);
     noStroke();
     fill(255,100,0);
    ellipse(width/2,height/2,50,50);   
     }
  
  renderpass1 = false;
}

