
class Body{
  float WLx, WLy, ELx, ELy, ShLx, ShLy, WRx, WRy, ERx, ERy, ShRx, ShRy, HLx, HLy, KnLx, KnLy, FtLx, FtLy, HRx, HRy, KnRx, KnRy, FtRx, FtRy, Nx, Ny, Tx, Ty;
  float angle1,angle2, angle3, angle4, angle5, angle6, angle7, angle8, angle9;
  float Weight, Space, Time, Flow, Height;
  float random1, random2, random3, random4, random5, random6, random7, random8;
  String Weight1, Space1, Time1, Flow1, Height1;
 
  Body (float WLx, float WLy, float ELx, float ELy, float ShLx, float ShLy, float WRx, float WRy, float ERx, float ERy, float ShRx, float ShRy, float HLx, float HLy, float KnLx, float KnLy, float FtLx, float FtLy, float HRx, float HRy, float KnRx, float KnRy, float FtRx, float FtRy, float Nx, float Ny, float Tx, float Ty, float angle1, float angle2, float angle3, float angle4, float angle5, float angle6, float angle7, float angle8, float angle9, float Weight, float Space, float Time, float Flow, float Height){
    this.WLx = WLx;
    this.WLy = WLy;
    this.ELx = ELx;
    this.ELy = ELy;
    this.ShLx = ShLx;
    this.ShLy = ShLy;
    this.WRx = WRx;
    this.WRy = WRy;
    this.ERx = ERx;
    this.ERy = ERy;
    this.ShRx = ShRx;
    this.ShRy = ShRy;
    this.HLx = HLx;
    this.HLy = HLy;
    this.KnLx = KnLx;
    this.KnLy = KnLy;
    this.FtLx = FtLx;
    this.FtLy = FtLy;
    this.HRx = HRx;
    this.HRy = HRy;
    this.KnRx = KnRx;
    this.KnRy = KnRy;
    this.FtRx = FtRx;
    this.FtRy = FtRy;
    this.Nx = Nx;
    this.Ny = Ny;
    this.Tx = Tx;
    this.Ty = Ty;
    this.angle1 = angle1;
    this.angle2 = angle2; 
    this.angle3 = angle3;
    this.angle4 = angle4;
    this.angle5 = angle5;
    this.angle6 = angle6;
    this.angle7 = angle7;
    this.angle8 = angle8;
    this.angle9 = angle9;
    this.Weight = Weight;
    this.Space = Space;
    this.Time = Time;
    this.Flow = Flow;
    this.Height = Height;
     }

  void makeNew(){    
      //Offset shoulder+hip location for aesthetic in drawing    
      random1=(random(-5,5) + ShLx);
      random2=(random(-5,5) + ShLy);
      random3=(random(-5,5) + ShRx);
      random4=(random(-5,5) + ShRy);
      random5=(random(-5,5) + HLx);
      random6=(random(-5,5) + HLy);
      random7=(random(-5,5) + HRx);
      random8=(random(-5,5) + HRy);
      
      //generate random angles for joints: shoulder and hip locations affect elbow and knees
      angle1 = random(0,360);
      angle2 = random(0,180);
      angle3 = random(0,360);
      angle4 = random(0,180);
      angle5 = random(0,360);
      angle6 = random(0,180);
      angle7 = random(0,360);
      angle8 = random(0,180);
      angle9 = random(0,180);
      
      //LArm
      //create polar coordinates to adjust elbow and wrist locations
      NewJoint1x = cos(angle1)*(radius);
      NewJoint1y = sin(angle1)*(radius);
      NewJoint2x = cos(angle2)*(radius);
      NewJoint2y = sin(angle2)*(radius);
      ELx = ShLx + NewJoint1x;
      ELy = ShLy + NewJoint1y;
      WLx = ELx + NewJoint2x;
      WLy = ELy + NewJoint2y;
      ShLx = random1;
      ShLy = random2;     
      
      //RArm
      //create polar coordinate to adjust elbow and wrist locations
      NewJoint3x = cos(angle3)*(radius);
      NewJoint3y = sin(angle3)*(radius);
      NewJoint4x = cos(angle4)*(radius);
      NewJoint4y = sin(angle4)*(radius);
      ERx = ShRx + NewJoint3x;
      ERy = ShRy + NewJoint3y;
      WRx = ERx + NewJoint4x;
      WRy = ERy + NewJoint4y;
      ShRx = random3;
      ShRy = random4;
      
      //LLeg
      //create polar coordinate to adjust elbow and wrist locations
      NewJoint5x = cos(angle5)*(radius);
      NewJoint5y = sin(angle5)*(radius);
      NewJoint6x = cos(angle6)*(radius);
      NewJoint6y = sin(angle6)*(radius);
      KnLx = HLx + NewJoint5x;
      KnLy = HLy + NewJoint5y;
      FtLx = KnLx + NewJoint6x;
      FtLy = KnLy + NewJoint6y;
      HLx = random5;
      HLy = random6;
      
      //RLeg
      //create polar coordinate to adjust elbow and wrist locations
      NewJoint7x = cos(angle7)*(radius);
      NewJoint7y = sin(angle7)*(radius);
      NewJoint8x = cos(angle8)*(radius);
      NewJoint8y = sin(angle8)*(radius);
      KnRx = HRx + NewJoint7x;
      KnRy = HRy + NewJoint7y;
      FtRx = KnRx + NewJoint8x;
      FtRy = KnRy + NewJoint8y;
 
      
      //Spine
      //by controlling the curve a chest can be implied
      Nx = abs(HRx - HLx)/2 + HLx;
      Tx = (abs(HRx - HLx)/2) + HLx;
      
      Weight = round(random(0,1)); //(random(0.1, 0.2) * 100)
      Space = round(random(0,1));
      Time = round(random(0,1));
      Flow = round(random(0,1));
      Height = round(random(0,4));
      }

  void drawBody(){
      noFill();
      stroke(75);
      
      //LArm
      strokeWeight(4);
      line(random1, random2, ELx, ELy);
      line(ELx, ELy, WLx, WLy);
      strokeWeight(1);
      ellipse(WLx, WLy, 10,10);
      
      //RArm    
      strokeWeight(4);
      line(random3, random4, ERx, ERy);
      line(ERx, ERy, WRx, WRy);
      strokeWeight(1);     
      ellipse(WRx, WRy, 10,10);
      
      //LLeg
      line(random5, random6, KnLx, KnLy);
      line(KnLx, KnLy, FtLx, FtLy);
      
      //RLeg     
      line(random7, random8, KnRx, KnRy);
      line(KnRx, KnRy, FtRx, FtRy);
      
      strokeWeight(2);
      stroke(0);
      
      beginShape();
      vertex ((random(-15, 15)+Nx),(random(-15, 15)+ Ny));
      bezierVertex((random(-15, 15)+ Nx), (random(-15, 15)+ Ny), (random(-15, 15)+ Tx), (random(-15, 15)+ Ty),(random(-15, 15)+ Tx),(random(-15, 15)+ Ty));
      endShape();
  
      //shoulder
      beginShape();
      vertex ((random(-15, 15)+ShLx),(random(-15, 15)+ ShLy));
      bezierVertex((random(-15, 15)+ ShLx), (random(-15, 15)+ ShLy), (random(-15, 15)+ ShRx), (random(-15, 15)+ ShRy),(random(-15, 15)+ ShRx),(random(-15, 15)+ ShRy));
      endShape();
  
      //hips
      beginShape();
      vertex ((random(-15, 15)+HLx),(random(-15, 15)+ HLy));
      bezierVertex((random(-15, 15)+ HLx), (random(-15, 15)+ HLy), (random(-15, 15)+ HRx), (random(-15, 15)+ HRy),(random(-15, 15)+ HRx),(random(-15, 15)+ HRy));
      endShape();
       
        fill(0);      
      if (Weight == 1){
          Weight1 = "Strong";
      }
          else{
            Weight1 = "Light";
          }
      
       if (Space == 1){
          Space1 = "Direct";
       }
          else{
            Space1 = "Indirect";
          }
      
       if (Time == 1){
          Time1 = "Sudden";
       }
          else{
            Time1 = "Sustained";
          }
      
       if (Flow == 1){
          Flow1 = "Bound";
       }
          else{
            Flow1 = "Free";
          }
      
      if (Height == 0){
          Height1 = "Low";
      }
        else if (Height == 1){
          Height1 = "Mid-Low";
        }
        else if (Height == 2){
          Height1 = "Middle";
        }
        else if (Height == 3){
          Height1 = "Mid-High";
        }
        else{
          Height1 = "High";
        }
        
      text("Height is " + Height1, 15, 35);
      text("Weight is " + Weight1, 15, 355); 
      text("Space is " + Space1, 15, 385);
      text("Time is " + Time1, 180, 355);
      text("Flow is " + Flow1, 180, 385);
      }
}

