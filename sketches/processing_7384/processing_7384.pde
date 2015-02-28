
float col1;
float col2;
float col3;


class BallBounce extends Ball
{

  BallBounce(float x, float y, float d, float s, float bSpeed,int orb1, int orb2, float twis, float cspd,float rcircx,float rcircy){
    super(x,y,d,s,bSpeed,orb1,orb2, twis, cspd,rcircx,rcircy); 
  }

  void display() {

    noStroke();
    float col1 = random(0,255);
    float col2 = random(0,85);
    float col3 = random(0,175);

    noStroke();
    fill(col1,col2,col3);
    ellipse(x,y,d,d);
  }

}





