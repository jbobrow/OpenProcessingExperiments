

void drawInfinity(color c) {
  
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  
  float sz = 25;
  color stCol = color(0,0,0);
    float sr = red(stCol);
    float sg = green(stCol);
    float sb = blue(stCol);
  float stW = 1;
  
  int szDivide = 5;
  int stWGrow = 5;
  
  fill(c);
  
  if(r< 100) {
    //rectangle///////////////////////////////////////////////////////////////////////////////////
    if(g< 100) {
      //sz/////////////////////////////////////////
      sz = 25;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      }
    } else if(g>= 100 && g< 200) {
      //stCol/////////////////////////////////////////
      sg = g;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      }
    } else {
      //stW//////////////////////////////////////////////
      stW = stWGrow;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        rect(newx,newy,sz,sz);
      }
    }
    //rectangle///////////////////////////////////////////////////////////////////////////////////
  } else if(r>= 100 && r< 200) {
    //circle//////////////////////////////////////////////////////////////////////////////////////
    if(g< 100) {
      //sz/////////////////////////////////////////
      sz = 25;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      }
    } else if(g>= 100 && g< 200) {
      //stCol/////////////////////////////////////////
      sg = g;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      }
    } else {
      //stW//////////////////////////////////////////////
      stW = stWGrow;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        ellipse(newx,newy,sz,sz);
      }
    }
    //circle//////////////////////////////////////////////////////////////////////////////////////
  } else {
    //triangle////////////////////////////////////////////////////////////////////////////////////
    if(g< 100) {
      //sz/////////////////////////////////////////
      sz = 25;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      }
    } else if(g>= 100 && g< 200) {
      //stCol/////////////////////////////////////////
      sg = g;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else if(b>= 100 && b< 200) {
        //stCol////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      }
    } else {
      //stW//////////////////////////////////////////////
      stW = stWGrow;
      if(b< 100) {
        //sz////////////
        sz = sz + (b/szDivide);
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else if(b>= 100 && b< 200) {
        //stCol/////////
        sb = b;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      } else {
        //stW//////////
        stW = stW + stWGrow;
        
        stCol = color(sr,sg,sb);
        stroke(stCol);
        strokeWeight(stW);
        triangle(newx-(sz/2),newy-(sz/2),newx+(sz/2),newy-(sz/2),newx,newy+(sz/2));
      }
    }
  }
  //triangle////////////////////////////////////////////////////////////////////////////////////
  
}

