
class chain1
{
 int joint_pos[][] = new int[4][4];
 int j_pos[][] = new int[4][4];
 float angle[] = new float[3];
 boolean dof = false;
 chain1()
 { 
   angle[0]=0 ;
   joint_pos[0][0] = 200;
   joint_pos[0][1] = 25;
   j_pos[0][0] = 200;
   j_pos[0][1] = 25;
   
   angle[1]=0 ;
   joint_pos[1][0] = 200;
   joint_pos[1][1] = 125;
   j_pos[1][0] = 200;
   j_pos[1][1] = 125;
   
   angle[2]=0 ;
   joint_pos[2][0] = 200;
   joint_pos[2][1] = 225;
   j_pos[2][0] = 200;
   j_pos[2][1] = 225;
  
   joint_pos[3][0] = 200;
   joint_pos[3][1] = 325;
   j_pos[3][0] = 200;
   j_pos[3][1] = 325;
     
 }
 
 void drawchain()
 { 
   
   pushMatrix();
   translate(joint_pos[0][0],joint_pos[0][1]);
   rotate(angle[0]);
   translate(-joint_pos[0][0],-joint_pos[0][1]);
   
   ellipse(joint_pos[0][0],joint_pos[0][1],5,5);
   line(joint_pos[0][0],joint_pos[0][1],joint_pos[1][0],joint_pos[1][1]);
   
   pushMatrix();
   translate(joint_pos[1][0],joint_pos[1][1]);
   rotate(angle[1]);
   translate(-joint_pos[1][0],-joint_pos[1][1]);
   ellipse(joint_pos[1][0],joint_pos[1][1],5,5);
   line(joint_pos[1][0],joint_pos[1][1],joint_pos[2][0],joint_pos[2][1]);
   j_pos[1][0] = (int) modelX(joint_pos[1][0],joint_pos[1][1],0);
   j_pos[1][1] = (int) modelY(joint_pos[1][0],joint_pos[1][1],0);
  
  // pushMatrix();
   translate(joint_pos[2][0],joint_pos[2][1]);
   rotate(angle[2]);
   translate(-joint_pos[2][0],-joint_pos[2][1]);
   ellipse(joint_pos[2][0],joint_pos[2][1],5,5);
   line(joint_pos[2][0],joint_pos[2][1],joint_pos[3][0],joint_pos[3][1]);
   ellipse(joint_pos[3][0],joint_pos[3][1],5,5);
   j_pos[2][0] = (int) modelX(joint_pos[2][0],joint_pos[2][1],0);
   j_pos[2][1] = (int) modelY(joint_pos[2][0],joint_pos[2][1],0);
   
   
   j_pos[3][0] = (int) modelX(joint_pos[3][0],joint_pos[3][1],0);
   j_pos[3][1] = (int) modelY(joint_pos[3][0],joint_pos[3][1],0);
   
  
   
   popMatrix();
   popMatrix();
   
  }
  
  void calcChain()
  {
   
   pushMatrix();
   translate(joint_pos[0][0],joint_pos[0][1]);
   rotate(angle[0]);
   translate(-joint_pos[0][0],-joint_pos[0][1]);
   
   pushMatrix();
   translate(joint_pos[1][0],joint_pos[1][1]);
   rotate(angle[1]);
   
   j_pos[1][0] = (int) modelX(joint_pos[1][0],joint_pos[1][1],0);
   j_pos[1][1] = (int) modelY(joint_pos[1][0],joint_pos[1][1],0);
  
  // pushMatrix();
   translate(joint_pos[2][0],joint_pos[2][1]);
   rotate(angle[2]);
   translate(-joint_pos[2][0],-joint_pos[2][1]);
   
   j_pos[2][0] = (int) modelX(joint_pos[2][0],joint_pos[2][1],0);
   j_pos[2][1] = (int) modelY(joint_pos[2][0],joint_pos[2][1],0);
   
   
   j_pos[3][0] = (int) modelX(joint_pos[3][0],joint_pos[3][1],0);
   j_pos[3][1] = (int) modelY(joint_pos[3][0],joint_pos[3][1],0);
   
  
   popMatrix();
   popMatrix();
  }
  
  
  void calculateIK()
  { 
   
    {
    PVector baseV = new PVector();
    PVector endV = new PVector();
    PVector desEndV = new PVector();
    PVector curV = new PVector();
    PVector crossRes = new PVector();
    PVector targetV = new PVector();
    
    float cosAngle=0,turnAngle=0;
    
    int x=0,y=0;
    int links=2;
    int tries = 0;
    int targetX=mouseX,targetY=mouseY;
    
   
    
    do
    {  
     baseV.x = j_pos[links][0];
     baseV.y = j_pos[links][1];
     
     endV.x = j_pos[3][0];
     endV.y = j_pos[3][1];
     
     desEndV.x = targetX;
     desEndV.y = targetY;
     
     curV.x = endV.x - baseV.x;
     curV.y = endV.y - baseV.y;
     
     targetV.x = targetX - baseV.x;
     targetV.y = targetY - baseV.y;
     
     curV.normalize();
     targetV.normalize();
     
     cosAngle = targetV.dot(curV);
     
     if(cosAngle< 0.9999)
       {
        crossRes = targetV.cross(curV);
        
        if(crossRes.z > 0.0f)
         {
           turnAngle = acos(cosAngle);
           angle[links] -= turnAngle;
           if(dof)
           {if(angle[links] >radians(45))
             angle[links]=radians(45);
           }
         }
         else if (crossRes.z < 0.0f)
         {
           turnAngle = acos(cosAngle);
           angle[links] += turnAngle; 
           if(dof)
           {if(angle[links] >radians(45))
             angle[links]=radians(45);
           }
         }
         
       }
       
    if(--links==3)
    {links = 2;
    }
    drawchain();
   }
   while(tries++ < 2);
   }
   
  } 
}  

