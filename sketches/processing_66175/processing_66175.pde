

int outerRing = 200, innerRing = 180, subRing = 60, //constants
  //user controlled
  mod_width = 0, mod_height = 0, mod_angle = 0, 
  mod_strokeWeight = 2, mod_scale = 0, frame_snap = 0, snap_frame = 5;

float mod_rotate = 0.0, centerX = 0.0, centerY = 0.0;
boolean mod_background = true, mouse_mod = false;

char mod_key = 'w'; //default control "width"

void setup(){
 size(500, 500); 
 smooth();
 
 strokeWeight(mod_strokeWeight);
 background(0);
 stroke(255);  
 noFill();
 
 centerX = width/2;
 centerY = height/2;
 
 drawComplexForm();
}

void drawComplexForm(){  

 if (mod_rotate > 0){
   pushMatrix();
   translate(centerX, centerY);
   rotate(radians(mod_rotate));   
   centerX = centerY = 0;
 }
  
 if ( mod_background ){
      background(0);
 }
 strokeWeight(mod_strokeWeight);
 //outer ellipse
 arc( centerX, centerY, outerRing + mod_scale + mod_width, outerRing + mod_scale + mod_height, -PI, 0);
 arc( centerX, centerY, outerRing + mod_scale + mod_width, outerRing + mod_scale + mod_height, 0, PI);
 
 //inner ellipse
 arc( centerX, centerY, innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height, -PI, 0);
 arc( centerX, centerY, innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height, 0, PI);
 
 //sub ellipse
 arc( centerX, centerY, subRing + mod_scale + mod_width, subRing + mod_scale + mod_height, -PI, 0);
 arc( centerX, centerY, subRing + mod_scale + mod_width, subRing + mod_scale + mod_height, 0, PI);
 

 
 //quadlipses
 arc( centerX+subRing-mod_scale, centerY+subRing-mod_scale, //x,y
     innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height, //height,width
     radians(245 - mod_angle), radians(285 + mod_angle) //start angle, end angle
 ); 
 arc( centerX-subRing+mod_scale, centerY-subRing+mod_scale,  //x,y
     innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height,   //height,width
     radians(65 - mod_angle), radians(105 + mod_angle) //start angle, end angle
 ); 
 arc( centerX+subRing-mod_scale, centerY-subRing+mod_scale, //x,y
      innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height,  //height,width 
      radians(155 - mod_angle), radians(195 + mod_angle) //start angle, end angle
 ); 
 arc( centerX-subRing+mod_scale, centerY+subRing-mod_scale, //x,y
   innerRing + mod_scale + mod_width, innerRing + mod_scale + mod_height,  //height,width 
   radians(335 - mod_angle), radians(375 + mod_angle) //start angle, end angle
 );


 strokeWeight(mod_strokeWeight+1);

 //vertical bezier
  bezier( centerX, centerY - mod_scale - innerRing - mod_height, //outer limit
         centerX - mod_angle, centerY - subRing - mod_angle - mod_scale, //control
         centerX + mod_angle, centerY + subRing + mod_angle + mod_scale, //control
         centerX, centerY + innerRing + mod_scale + mod_height); //outer limit
         
  //horizontal bezier     
  bezier( centerX - innerRing - mod_scale - mod_width, centerY, //outer limit
         centerX - subRing - mod_angle - mod_scale, centerY - mod_angle, //control 
         centerX + subRing + mod_angle + mod_scale, centerY + mod_angle, //control
         centerX + innerRing + mod_scale + mod_width, centerY); //outer limit
         
  strokeWeight(1);  
  if ( mod_rotate > 0 ){
    centerX = width/2;
    centerY = height/2;
    translate(centerX, centerY);
    popMatrix();
  }
  
  frame_snap++;
  if ( frame_snap % snap_frame == 0 ){
   saveFrame("sketches/sketch-####.jpg");
  }
}

void draw(){}

void mouseMoved() {
  if ( !mouse_mod ){ return; }
  mod_width = centerX > mouseX ? mod_width + 1 : mod_width -1;
  mod_height = centerY > mouseY ? mod_height + 1 : mod_height -1;
  mod_scale = (mouseX + mouseY <= 0 ? 2 : (mouseX + mouseY) / 10);
  mod_angle = (mouseX + mouseY <= 0 ? 2 : (mouseX + mouseY) > (mouseX + mouseY) /2 ? (mouseX - mouseY) / 10 : (mouseX + mouseY) / 10);
  mod_rotate = (mouseX + mouseY <= 0 ? 2 : (mouseX + mouseY) > (mouseX + mouseY) /2 ? (mouseX - mouseY) / 10 : (mouseX + mouseY) / 10);;
  drawComplexForm();
}

void keyPressed(){  
  switch (keyCode){
      case UP: 
        switch (mod_key){
          case 'w': mod_width++;break;
          case 'h': mod_height++;break;
          case 'a': mod_angle++;break;     
          case 'l': mod_strokeWeight++; break;     
          case 's': mod_scale ++;break;
          case 'r': if ( mod_rotate <= 0 ){
                      mod_rotate = 360;
                    }else{
                      mod_rotate -= 2;
                    }
                    break;
        }   
        break;
      case DOWN:
        switch (mod_key){
          case 'w': mod_width--;break;
          case 'h': mod_height--;break;
          case 'a': mod_angle--;break;      
          case 'l': if ( --mod_strokeWeight <= 0 ){
                        mod_strokeWeight = 0;
                    }
                    break;    
          case 's': mod_scale --;break;
          case 'r': if ( mod_rotate > 360 ){
                      mod_rotate = 0;
                    }else{
                      mod_rotate += 2;
                    }
                    break;
        }        
        break;
      default:
        switch(key){
          case 'w' : case 'h' : case 'a' : case 'l' : case 's' :
          case 'r' :
            mod_key = key; break;
          case 'b' : mod_background = !mod_background; break;
          case 'p' : saveFrame("sketches/original_image.jpg");break;
          case 'm' : mouse_mod = !mouse_mod; break;
          case 'x' :  mod_width = 0;
                      mod_height = 0;
                      mod_angle = 0;
                      mod_rotate = 0;
                      mod_strokeWeight = 1;
                      mod_scale = 0;
                    break;
          default:
            print("mod_key::{");
            print(mod_key);
            print("}>> modifier for mod_key not defined for input ");
            print("KEYCODE<");
            print(keyCode);
            print(">, KEY<");
            print(key);
            println("> 8(");
        }
  }

  print(">>> Current Mode: ");
  switch (mod_key){
     case 'w' : print("WIDTH");break;
     case 'h' : print("HEIGHT");break;
     case 'a' : print("ANGLE");break;
     case 's' : print("SCALE");break;
     case 'l' : print("LINE WEIGHT");break;
     case 'r' : print("ROTATE");break;
     default: print("!!NONE SET!!");   
  }
  println("");
  drawComplexForm();  
}

