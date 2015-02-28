
 void keyPressed(){
 if(key == '1'){
   for (int i = 0 ; i < bksound.bufferSize () - 1 ; i++) {
    float x = random(0,1000);
    float y = random (0,300) ;
    if (i == 0) {
     noStroke() ;
     fill (#74E600) ;
     ellipse(x,y,bksound.left.get(i)*400,bksound.left.get(i)*400);
     }
    }//end for loop
  }//A
  
  else if(key == 'a' || key == 'A'){
    for (int i = 0 ; i < bksound.bufferSize () - 1 ; i++) {
    float x = random(0,1000);
    float y = random (200,500) ;
    if (i == 0) {
    noStroke() ;
    fill (#FF3D00);
    ellipse(x,y,bksound.right.get(i)*400,bksound.right.get(i)*400);
    } 
    }//for
  }//1
    
  else if(key == '2'){
    int lapse = millis() - time;
      for (int i = 0; i < bksound.left.size()-1; i++)
      {
        float column_norm = line_height/1*(0+1.5*y);
        fill(0, map( abs(bksound.left.get(i)), 0, .2, 0, 255), 0);
        stroke(0);
        strokeWeight(1);
        rect(x, y, 10, 10);
        x+=100; // color bar stable on screen as the speed increase
      if (lapse > mspb || x > width )
      {
        // start a new line on the left
        time = millis();
        y += 1; // or 1
        x = 0;
        
        if (y > height)  
        {
          // start a new page from top
          y = 0;
         }//if
        } // if
      } // for
    } //2
    
    
    else if(key == 'b' || key == 'B'){
      int lapse = millis() - time;
      for (int i = 0; i < bksound.right.size()-1; i++)
      {
        float column_norm = line_height/1*(0+1.5*y);
        fill(map( abs(bksound.right.get(i)), 0, .2, 0, 255),0,0);
        stroke(0);
        strokeWeight(1);
        rect(x, y, 5, 5);
        x+=10;
      if (lapse > mspb || x > width )
      {
        // start a new line on the left
        time = millis();
        y += 1; // color bar scroll down
        x = 0;
        if (y > height)   
        {
          // start a new page from top
          y = 0;
         }//if
        } // if
      } // for
   
    } //b
    
    
    
    else if(keyCode == ENTER){
      int lapse = millis() - time;
      //
      for (int i = 0; i < bksound.bufferSize()-1; i++)
      {
        float column_norm = line_height/1*(0+1.5*y);
        fill(map( abs(bksound.right.get(i)), 0, .2, 0, 255),map( abs(bksound.left.get(i)), 0, .2, 0, 255),2);
        stroke(0);
        rect(x, y, 20, 20);
        x+=6;
      } // forloop
     
      if (lapse > mspb || x > width )
      {
        time = millis();
        y += 1; // or 1
        x = 0;
        if (y > height)   
        {
          y = 0;
          background(0);
        } // if
      } // if
    } //enter
    
    
   

 }//keypressed

