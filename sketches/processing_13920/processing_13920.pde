

class Curve{

  float maxLength;
  float strokeMax;
  float maxTan;
  float strokeW;
  float curveHue;
  float strokeShrink;
  float branchChance;
  float childBirthSize;

  float[] pos1 = new float[2];
  float[] tan1 = new float[2];
  float[] pos2 = new float[2];
  float[] tan2 = new float[2];  

  Curve(float mLength, float mTan, float sWidth, float sShrink, float bChance, float cbSize, float xPos, float yPos, float cHue){
    maxLength = mLength;
    strokeMax = sWidth;
    maxTan = mTan;
    strokeW = sWidth;
    strokeShrink = sShrink;
    branchChance = bChance;
    curveHue = cHue;
    childBirthSize = cbSize;
    
    pos1 = new float[]{xPos, yPos};
   tan1 = new float[]{random(pos1[0]-maxTan/2, pos1[0]+maxTan/2), random(pos1[1]-maxTan/2, pos1[1]+maxTan/2)};
    pos2 = new float[]{random(pos1[0]-maxLength/2, pos1[0]+maxLength/2), random(pos1[1]-maxLength/2, pos1[1]+maxLength/2)};
   tan2 = new float[]{random(pos2[0]-maxTan/2, pos2[0]+maxTan/2), random(pos2[1]-maxTan/2, pos2[1]+maxTan/2)};  
  }
  
  void display(){
    noFill();  
    stroke(curveHue, 255, 255, 255);
    //strokeCap(ROUND);
    strokeWeight(strokeW);
    bezier(pos1[0], pos1[1], tan1[0], tan1[1], tan2[0], tan2[1], pos2[0], pos2[1]); 
    if(strokeW * .75 > .06){
      stroke(curveHue, 255, 230, 255);  
      strokeWeight(strokeW*.75);
      bezier(pos1[0], pos1[1], tan1[0], tan1[1], tan2[0], tan2[1], pos2[0], pos2[1]);   
    }
    
    float[] newPos2 = {constrain(random(pos2[0]-maxLength/2, pos2[0]+maxLength/2), 0+strokeW/2, width-strokeW/2), constrain(random(pos2[1]-maxLength/2, pos2[1]+maxLength/2),0+strokeW/2,height-strokeW/2)    };
    float[] newTan2 = {constrain(random(newPos2[0]-maxTan/2, newPos2[0]+maxTan/2), 0+strokeW/2, width-strokeW/2), constrain(random(newPos2[1]-maxTan/2, newPos2[1]+maxTan/2),0+strokeW/2,height-strokeW/2)    }; 

    pos1[0] = pos2[0];
    pos1[1] = pos2[1];
    tan1[0] = tan2[0];
    tan1[1] = tan2[1];
    pos2[0] = newPos2[0];
    pos2[1] = newPos2[1];
    tan2[0] = newTan2[0];
    tan2[1] = newTan2[1];
    
    float hueChange = random(-2, 2);
    curveHue = constrain((curveHue+hueChange), 0, 255);    
    
    strokeW -= strokeShrink;
 

    float rand = random(0,100);
    if(rand < branchChance){
      if(curves.size() < maxCurves){
        float newSize = constrain(childBirthSize * strokeW, 0, strokeMax);
        curves.add(new Curve(maxLength, maxTan, newSize, strokeShrink, branchChance, childBirthSize, pos1[0], pos1[1], curveHue));
      }
    }   
  }
 
  void strokeCheck(int i){ 
    if(strokeW < .5){
      curves.remove(i);
    }  
  }


}




