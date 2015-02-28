
class Place{
  int code;
  String name;
  float x;
  float y;

  int partial[];
  int matchDepth;

  public Place(int code, String name, float x, float y){
    this.code = code;
    this.name = name;
    this.x = x;
    this.y = y;

    partial = new int[8];
    partial[7] = code;
    partial[6] = partial[7]/10;
    partial[5] = partial[6]/10;
    partial[4] = partial[5]/10;
    partial[3] = partial[4]/10;
    partial[2] = partial[3]/10;
    partial[1] = partial[2]/10;
  }

  public void check(){
    matchDepth = 0;

    if(typedCount != 0){
      for(int j = typedCount;j>0;--j){
        if(typedPartials[j] == partial[j]){
          matchDepth = j;
          break;
        }
      }
    }
    if(matchDepth == typedCount){
      foundCount++;
      if(typedCount == 7){
        chosen = this;
      }

      if(x<boundsX1)boundsX1=x;
      if(x>boundsX2)boundsX2=x;
      if(y<boundsY1)boundsY1=y;
      if(y>boundsY2)boundsY2=y;

    }
  }


  public void draw(){
    float xx = (int) TX(x);
    float yy = (int) TY(y);

    if((xx<0) || (yy<0) || (xx>=width) || (yy>=height))return;

    if((zoomDepth.value < 2.8f) || !zoomEnabled){
      set((int)xx,(int)yy,faders[matchDepth].value);
    }
    else{
      noStroke();
      fill(faders[matchDepth].value);
    }

    if(matchDepth == typedCount){
      if(typedCount == 6){
        text(code%10,TX(x),TY(y));
      }
      else{
        rect(xx,yy,zoomDepth.value,zoomDepth.value);
      }
    }
    else{
      rect(xx,yy,zoomDepth.value-1,zoomDepth.value-1);
    }
    //    set(xx,yy,faders[matchDepth].value);
  }

  public void drawChosen(){
    noStroke();
    fill(highlightedColor);
    int size = zoomEnabled ? 6:4;
    rect(TX(x),TY(y),size,size);

    float textX = TX(x);
    float textY = TY(y)-size-4;

    if(textY<20){
      textY = TY(y)+20;
    }

    if(textY>height-5){
      textY = TY(y)-20;
    }

    String location = name + " " + nf(code,7);

    if(zoomEnabled){
      textAlign(CENTER);
      text(location,textX,textY);
    }
    else{
      float wide = textWidth(location);

      if(textX>width/3){
        textX -= wide+8;
      }
      else{
        textX += 8;
      }

      textAlign(LEFT);
      fill(highlightedColor);

      text(location,textX,textY);
    }
  }
}








