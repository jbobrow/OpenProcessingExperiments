
class Letter{
  float w;
  float h;
  float x;
  float y;
  boolean type;
  RFont currentFont;
  
  RPoint[][] pointsContour;
  RGroup group;
  char letter;
  
  Letter(float x, float y, String letter, boolean type){
    this.x = x;
    this.y = y;
    if(type==true){
      this.currentFont = font;
    }else{
      this.currentFont = font2;
    }
    this.type = type;
    
    
    group = currentFont.toGroup(letter);
    w = group.getWidth();
    h = group.getHeight();
    pointsContour = group.getPointsInPaths();
    
    float decalage = w;
    for (int i=0; i < pointsContour.length; i++ ) {
     
     for (int j=0; j < pointsContour[i].length-1;j++ ) {
      if(pointsContour[i][j].x < decalage){
        decalage = pointsContour[i][j].x;
      }
     
     }
   }
    
   for (int i=0; i < pointsContour.length; i++ ) {
     
     for (int j=0; j < pointsContour[i].length-1;j++ ) {
       pointsContour[i][j].x -= decalage;
     
     }
   }
       
    //print("letter "+letter+" x="+x+" y="+y+" w="+w+" h="+h+"\n");
    
    
  }
  
  void affiche (){
    
    if(afficheMode == 0){
      afficheFormes();
    }else if(afficheMode == 1){
      afficheTypo();
    }
    
  }
  
  
  void afficheTypo(){
   
    
    if(type == true){
      //SI TYPO 1
      //telle couleur telle fonte telle forme, etc.
      fill(couleur_R1, couleur_V1, couleur_B1, alpha1);
    }else{
      fill(couleur_R2, couleur_V2, couleur_B2, alpha2);
    }
    
    //rect(x, y, w, h);
    for (int i=0; i < pointsContour.length; i++ ) {
      beginShape();
      for (int j=0; j < pointsContour[i].length-1;j++ ) {
        vertex(pointsContour[i][j].x+x, pointsContour[i][j].y+y);
      }
      endShape();
    }
  }
  
  void afficheFormes(){
    if(type == true){
      //SI TYPO 1
      //telle couleur telle fonte telle forme, etc.
      fill(couleur_R1, couleur_V1, couleur_B1, alpha1);
    }else{
      
      
      fill(couleur_R2, couleur_V2, couleur_B2, alpha2);
    }  
       //taille du diametre
    float diameter = 18;
    
   
    
    
   for (int i=0; i < pointsContour.length; i++ ) {
     
     
     for (int j=0; j < pointsContour[i].length-1;j++ ) {
       
         // sur chaque troisième point
      if (j%2 == 0) {
        // faites pivoter le module  (i +1)
        pushMatrix();
        float angle = atan2(pointsContour[i][j].y-pointsContour[i][j+1].y, pointsContour[i][j].x-pointsContour[i][j+1].x);
        translate(pointsContour[i][j].x+x, pointsContour[i][j].y+y);
        rotate(angle);
        rotate(radians(-mouseX));
        shape(module1, 0,0, diameter+(mouseY/2.5),diameter+(mouseY/2.5));
        popMatrix();
      }
     }
     
   }
  }
  

}

