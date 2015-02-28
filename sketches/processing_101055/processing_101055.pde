
  /* @pjs preload="duckrgb.png, duckz.png"; 
   */

  
         PImage texRgb;
         PImage texZ;
           float cam_dist  = 350;

     
     
        public void setup() {
          size(300, 300,P3D);
          frameRate(30);
      rectMode(CENTER);
      texRgb=loadImage("duckrgb.png");
      texZ=loadImage("duckz.png");
      strokeWeight(3);
  //        addMouseWheelListener(new java.awt.event.MouseWheelListener() {  public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { mouseScroll=  -evt.getWheelRotation();  mouseScrolled();    }});
}
         
     
     
        public  void draw() {
          background(0);
            float angle = radians(frameCount);
             
            pushMatrix();
                          translate(texRgb.height/2,texRgb.height/2,-texRgb.height+150-cam_dist);
     rotateY(camrotY);
         rotateX(camrotX);
         rotateZ(sin(angle) * PI / 12.0f);
     
               angle += radians(camrotX+camrotY);
                 translate(0,0,texRgb.height/2);
               for(int x=0;x<texRgb.width;x++){
                 for(int y=0;y<texRgb.height;y++){
                   int i=y*texRgb.height+x;
               if( red(texZ.pixels[i])+ green(texZ.pixels[i])+ blue(texZ.pixels[i])>300)   { //  drawLine((x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, 0, (x-lettergt.width/2)*scale, (y-lettergt.height/2)*scale, depth);
                 float zett=red(texZ.pixels[i])+ green(texZ.pixels[i])+ blue(texZ.pixels[i]);
              stroke(color(( texRgb.pixels[i])));
                 point((x-texRgb.width/2), (y-texRgb.height/2), zett*.3f
                           );  
               } }}
                      
                      

     
   

           popMatrix();
        }
         

         
           float camrotX,camrotY;
          public void mouseDragged(){camrotY-=radians(pmouseX-mouseX);camrotX+=radians(pmouseY-mouseY);}  
        float mouseScroll;
        void mouseScrolled() {    cam_dist-=this.mouseScroll*10;  }


