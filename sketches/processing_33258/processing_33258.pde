
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/33258*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* 
This sketch demonstrates the behavior of nodes which are linked 
to each other by spring-like connections exectuing a force proportional like
   F = -k.x  (x elongation out of optimum distance)
Each node can keep a limited number of links defined by a min and a max limit.
Optionally, the links "break and reconnect" to closest nodes.

Links are stored as separate objects in a global list, so that link-specific operations (like drawing) can be quickly performed.
Networks now recognize subnetworks. 

2011 (c) Bernhard Schaffer
*/

long    UniqueID=0;        // global counter. Ensures each ID is only used once. Used for nodes and links
ArrayList Network;        // List of all nodes
ArrayList LinkList;       // List of all links between nodes

// default start parameters
int startNodes = 500;
int minCon     = 2;
int maxCon     = 2;

boolean drawNetworkLinks = false;    // draw Link-Objects
boolean drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
boolean drawNodesDefault = false;          
boolean drawLinksDefault = true;
int NetworkColorMode=0;

boolean globalBoundary=true;
boolean reLink = true;
boolean reLinkOnStandstill = false;
boolean Gravity=false;
boolean pause=false;
int fadeMode=1;
float defaultDragMod = 0.9;
float mouseDragMod=defaultDragMod;
float defaultFstrength =0.02;//0.8;//.001;
float defaultFriction = 0.98;// 0.5;//0.98;
float defaultRange=18;

// variables
Node N;
Link L;
Node SelNode;

void setup()
{
  size(800,600);
  colorMode(HSB,255,255,255,255);
  Init(10,500);
}
void Init(int minCount, int maxCount)
{
  SelNode = new Node(0,0);
  startNodes = round(random(minCount,maxCount));
  Network = new ArrayList();
  LinkList = new ArrayList();
  for (int i=0;i<startNodes;i++)
    {
      N = new Node(random(10,width-10),random(10,height-10));
      N.maxLinks=maxCon;
  
      N.col=color(random(0,255),random(100,255),255);
      N.NodeLinkColor = N.col;
      Network.add(N);
    }
  for (int i=0;i<startNodes;i++)
    {
      N = (Node) Network.get(i);
      N.LinkNearestN(minCon);
    }
   if (fadeMode==1) background(255);
   else if (fadeMode==2) background(0);
}

void draw()
{
  if (fadeMode==1)
    {
     fill(255,15);
     noStroke();
     rect(0,0,width,height);
    }
  else if (fadeMode==2)
    {
     fill(0,15);
     noStroke();
     rect(0,0,width,height);
    }   
  else background(0); 
  if (!pause)
    {
    for (int i=0;i<Network.size();i++)
    {
      N = (Node) Network.get(i);
      N.Move();
    }  
    if (reLink)
      {
      for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);
        N.RemoveAllLinks();
        }
      for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);
        N.LinkNearestN(minCon);
        }
      }
    else if (reLinkOnStandstill)
      {
      for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);
        if (N.Speed.mag()<0.01) N.RemoveAllLinks();
        }
      for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);
        if (N.Speed.mag()<0.01) N.LinkNearestN(minCon);
        }
      }
    }
  if (drawNetworkLinks) for (int i=0;i<LinkList.size();i++)
  {
    L = (Link) LinkList.get(i);
    L.DrawMe();
  }
  if (drawNetworkNodes) for (int i=0;i<Network.size();i++)
  {
    N = (Node) Network.get(i);
    N.DrawMe();
    //println("Node #"+i+": links = "+N.Links.size());
  }
  //println("links:"+LinkList.size());
  // Mouse Movements
  for (int i=0;i<Network.size();i++)
    {
      N = (Node) Network.get(i);
      if (N.isDragged) N.MoveToMouse();
    }
   NetWorkID();
}

void NetWorkID()
{
    ArrayList store,Net;
    ArrayList ListOfNets;
    store = new ArrayList();
    ListOfNets = new ArrayList();
    
    for (int i=0;i<Network.size();i++)
    {
      N = (Node) Network.get(i);
      N.inNetwork=false;
      store.add(N);
    }
    while (store.size()>0)
      {
        N = (Node) store.get(0);
        Net = new ArrayList();
        N.addToNet(Net);
        ListOfNets.add(Net);
        for (int j=0;j<Net.size();j++)
          {
            N = (Node) Net.get(j);
            store.remove(N);
          }      
      }
    // Now recolor all the nodes according to their subnet
    int NrNets = ListOfNets.size();
    for (int i=0;i<NrNets;i++)
      {
        color copyCol=255;
        Net = (ArrayList) ListOfNets.get(i);
        for (int j=0;j<Net.size();j++)
          {
            N = (Node) Net.get(j);
            if (NetworkColorMode==1)
              {
              N.col = color(20,0,255-Net.size()*5);
              N.NodeLinkColor = color(255/NrNets*i,255,255);
              }
            else if (NetworkColorMode==2)
              {
              N.col = color(255/NrNets*i,255,255);
              N.NodeLinkColor = color(20,0,255-Net.size()*5);
              }
            else if (NetworkColorMode==3)
              {
              N.col = color(255/NrNets*i,255,255);
              N.NodeLinkColor = color(255/NrNets*i,255,255);;
              }
            else if (NetworkColorMode==4)
              {
                if (j==0) copyCol=N.col;
                else N.col=copyCol;
                N.NodeLinkColor=N.col;
              // keep color random
              }
            else 
              {
              N.col = color(20,0,255-Net.size()*5);
              N.NodeLinkColor = color(20,0,255-Net.size()*5);
              }
              
          }
      }

    
}

//Mouse Interaction
void mousePressed()
  {
    PVector mousePos = new PVector(mouseX,mouseY);
    if (mouseButton == LEFT)
      {
      for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);     
        N.SetIsDragged(N.IsInside(mousePos),mousePos );
        }
      }
    else if (mouseButton == RIGHT)
      {
        pause=true;
        boolean canCreate=true;
        for (int i=0;i<Network.size();i++)
        {
        N = (Node) Network.get(i);
        if (N.IsInside(new PVector(mouseX,mouseY))) 
          {
            canCreate=false ;
            SelNode=N;
         
          }
        }
        if (canCreate)
        {
            N = new Node(mouseX,mouseY);
            N.maxLinks=maxCon;
            N.col=color(random(0,255),random(100,255),255);
            Network.add(N);
            N.LinkNearestN(minCon);
            SelNode = N;
        }
      }
  }
void mouseReleased()
  {

   for (int i=0;i<Network.size();i++)
    {
      N = (Node) Network.get(i);      
      N.SetIsDragged(false, new PVector(0,0));
      N.range = SelNode.range;
      N.maxAcceptRange=N.range*3;
    }
   SelNode.drawRange=false; 
   SelNode = new Node(0,0);
   pause=false;
  }
  
void mouseDragged()
  {
    if (mouseButton==RIGHT)
      {
        SelNode.drawRange=true;
        SelNode.range = dist(SelNode.Pos.x,SelNode.Pos.y,mouseX,mouseY);
      }
  }

  
 void keyReleased()
  {
    if (key=='n')  
        {
          drawNodesDefault=!drawNodesDefault;
          for (int i=0;i<Network.size();i++)
              {
              N = (Node) Network.get(i);
              N.drawNode = drawNodesDefault;
              }
        }
    if (key=='c')
      {
        NetworkColorMode++;
        if (NetworkColorMode>4) NetworkColorMode=0;
      }
    if (key=='l') 
        {
          drawLinksDefault=!drawLinksDefault;  
          for (int i=0;i<Network.size();i++)
              {
              N = (Node) Network.get(i);
              N.drawLinks = drawLinksDefault;
              }   
        }
    if (key=='f') 
        {
          fadeMode++;
          if (fadeMode>2) fadeMode=0;
        }
   if (key=='+')
       {
         maxCon++;
         minCon=maxCon;
          for (int i=0;i<Network.size();i++)
              {
              N = (Node) Network.get(i);
              N.maxLinks = maxCon;
              }   
          println("Connections:"+minCon+"-"+maxCon);
       }
   if (key=='r') reLink=!reLink;
   if (key=='-')
       {
         maxCon--;
         if (maxCon<0) maxCon=0;
         minCon=maxCon;
          for (int i=0;i<Network.size();i++)
              {
              N = (Node) Network.get(i);
              N.maxLinks = maxCon;
              }   
          println("Connections:"+minCon+"-"+maxCon);
       }
   if (key=='p') pause=!pause;
   if (key=='b') globalBoundary=!globalBoundary;
   if (key==' ') Init(10,500);
   if (key=='m')
     {
       N = (Node) Network.get(floor(random(0,Network.size())));
       N.Speed.x+=random(0,30)-15;
       N.Speed.y+=random(0,30)-15;
     }
   if (key=='1')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = false;       
       drawLinksDefault = true;   
       NetworkColorMode=0;
       reLink = true;
       reLinkOnStandstill = false;
       Gravity=false;
       fadeMode=1;
       minCon     = 2;
       maxCon     = 2;
       defaultRange=18;
       defaultFstrength =0.02;//0.8;//.001;
       defaultFriction = 0.98;// 0.5;//0.98;
       defaultRange=18;
       Init(50,500);
     }
   if (key=='2')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = true;       
       drawLinksDefault = true;   
       NetworkColorMode=3;
       reLink = false;
       reLinkOnStandstill = false;
       Gravity=false;
       fadeMode=2;
       minCon     = 5;
       maxCon     = 5;
       defaultFstrength =0.02;//0.8;//.001;
       defaultFriction = 0.98;// 0.5;//0.98;
       defaultRange=40;
       Init(30,40);
     }
   if (key=='3')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = false;       
       drawLinksDefault = true;   
       NetworkColorMode=3;
       reLink = true;
       reLinkOnStandstill = false;
       Gravity=false;
       fadeMode=0;
       minCon     = 2;
       maxCon     = 2;
       defaultFstrength =0.02;//0.8;//.001;
       defaultFriction = 0.98;// 0.5;//0.98;
       defaultRange=15;
       Init(1200,1800);
     }
   if (key=='4')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = true;       
       drawLinksDefault = true;   
       NetworkColorMode=3;
       reLink = true;
       reLinkOnStandstill = false;
       Gravity=false;
       fadeMode=0;
       minCon     = 2;
       maxCon     = 2;
       defaultFstrength =1;//0.8;//.001;
       defaultFriction = 0.6;// 0.5;//0.98;
       defaultRange=50;
       Init(30,50);
     }
   if (key=='5')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = false;       
       drawLinksDefault = true;   
       NetworkColorMode=4;
       reLink = false;
       reLinkOnStandstill = true;
       Gravity=false;
       fadeMode=0;
       minCon     = 1;
       maxCon     = 2;
       defaultFstrength =1;//0.8;//.001;
       defaultFriction = 0.6;// 0.5;//0.98;
       defaultRange=10;
       Init(500,1000);
     }
   if (key=='6')
      {
       drawNetworkLinks = false;    // draw Link-Objects
       drawNetworkNodes = true;     // draw Nodes-Objects (further specification via object-variable)
       drawNodesDefault = false;       
       drawLinksDefault = true;   
       NetworkColorMode=0;
       reLink = false;
       reLinkOnStandstill = true;
       Gravity=false;
       fadeMode=1;
       minCon     = 2;
       maxCon     = 2;
       defaultFstrength =1;//0.8;//.001;
       defaultFriction = 0.6;// 0.5;//0.98;
       defaultRange=10;
       Init(500,1000);
     }
  }
// Minimalistic class to wrap the use of ArrayLists. Also ensures each ID is only used once.
class IDclass
{
  long ID;
  IDclass(long IDin){ID=IDin;}
}
class Link
{
  Node N1,N2;      // N1 is always the default SOURCE of charges.
  color col;
  long ID;
  int thickness;
  
  Link(Node N1in, Node N2in)
  {
    N1=N1in;
    N2=N2in;
    ID = UniqueID;
    UniqueID++;        // global counter. Ensures each ID is only used once.
    thickness = 1;
    col = color(255,0,255,100);
    N1.AddLink(this);
    N2.AddLink(this);
  }
  float GetLength()
  {
    return PVector.sub(N1.Pos,N2.Pos).mag();
  }
  void UnLink()
    {
    N1.RemoveLink(this);
    N2.RemoveLink(this);
    }
   
   Node GetLinkedNode(Node testNode)  // returns the Neuron linked to NID via this link!
     {
        if (N1.ID==testNode.ID) return N2;
        else                    return N1;
     }
    
  void DrawMe()
  {
   strokeWeight(thickness);
   stroke(col);
   line(N1.Pos.x,N1.Pos.y,N2.Pos.x,N2.Pos.y);
  }
}

class Node
{
  PVector Pos, Speed;  // Position and Speed vector of a node
  float rad;           // radus of a node (solid, drawing)
  float range;         // rangde radius of node (ideal distance, force)
  color col;           // drawing color of node
  long  ID;            // ID number of node
  float Fstrength;     // Parameter to adjust strength of spring-links. Bigger is stronger 
  float friction;      // Paramater to adjust speed. Speed magnitued is damped by friction in each calculation. 0 = maximum friction, no movement. 1= no friction.
  boolean drawForceComponents;  // If true, forces acting on nodes are drawn (in "force color")
  boolean drawForce;            // If true, resulting total force is drawn (in "force color")
  boolean drawRange;            // If true, the range (ideal distance, force) is drawn
  boolean drawNode;             // If true, the node is drawn.
  boolean drawLinks;            // If true, the links of this node are drawn (in "NodeLinkColor"), note that links may also be drawn as globally from the links class!
  boolean dampHighSpeed=true;
  color forceColor;             // color to draw forces in. 
  color NodeLinkColor;          // color of the links of this node.
  float maxAcceptRange;         // connections outside this range are not formed (but kept)
  boolean inNetwork;
  
  ArrayList Links;    // List of links from this node
  int maxLinks ;      // maximum number of links a node may have
  boolean isDragged;  // temporary variable indicating if node is currently dragged by mouse.
  PVector Handle;     // PVector to deal with mouse-interaction during dragging. 
   
 
  Node(float px, float py)
  {
    Pos = new PVector(px,py);
    Speed = new PVector(0,0);
    ID = UniqueID;
    UniqueID++;        // global counter. Ensures each ID is only used once.
    maxLinks = 3;
    Fstrength = defaultFstrength; 
    friction = defaultFriction;
    
    rad = 5;
    range = defaultRange;
    maxAcceptRange=range*3;
    col=color(0,255,255);
    
    drawForceComponents = false; 
    drawForce = false;
    drawRange = false;
    drawNode = drawNodesDefault;
    drawLinks = drawLinksDefault;
    forceColor=col;
    NodeLinkColor=color(150,255,255,100);
    isDragged=false;
    Links = new ArrayList();
  }
  
  // funcitions for mouse-interaction
  boolean IsInside(PVector Test)    // Test whether a Test-point is within the node
    {
      PVector diff = PVector.sub(Test,Pos);
      if (diff.mag()<=rad) return true;
      else return false;
    }
  void SetIsDragged(boolean setvalue, PVector DragPoint)    // Activates/releases dragging. A handle-distance is stored
    {
     isDragged=setvalue;
     if (isDragged) Handle=PVector.sub(DragPoint,Pos);
     else           Handle=new PVector(0,0);
     }  
  void MoveToMouse() //{Pos = PVector.sub(new PVector(mouseX,mouseY),Handle);}
  {
    Speed = PVector.sub(new PVector(mouseX,mouseY),Pos);
    Speed.mult(mouseDragMod);
  }

  //functions to link other nodes, remove nodes or find linked nodes
  int CountLinks(){return Links.size();};
  void AddLink(Link LinkRef){Links.add(LinkRef);}
  void RemoveLink(Link LinkRef)
    {
        for (int k=0; k<Links.size();k++)
            {
              Link CheckLink = (Link) Links.get(k);  
              if (CheckLink==LinkRef)
                {
                  Links.remove(k);
                  k=Links.size();
                }
            }
    }
  void RemoveAllLinks()
  {
      Link L;
      while(Links.size()>0) // repeat for all links of this node
        {
          Link CheckLink = (Link) Links.get(0);  
          for (int k=0; k<LinkList.size();k++) // run through all (global)links to identify the current link
            {
              L = (Link) LinkList.get(k);
              if (L==CheckLink) // unlink the current link, remove it from the (global) link list
                  {
                    L.UnLink();
                    LinkList.remove(k);
                    k=LinkList.size();
                  }
            }
        }
  }
  boolean IsLinked(Node testNode)    // returns true if the testNode is already linked to this node
    {
      Link testLink;
      // check all links of the testNode and if the partner is this node!
      for (int k=0; k<testNode.Links.size(); k++)
        {
          testLink = (Link) testNode.Links.get(k);
          if (this==testLink.GetLinkedNode(testNode)) return true;
        }
      return false;
    }
  void LinkNearest()   // Link to closest node which has a free link available
  {
    //println("try...");
    Link L;
    Node N;
    Node minN = this;
    float d;
    float mindist=width*height; // large number to start with;

    for (int i=0;i<Network.size();i++)  // Check all nodes of the network to identify closest.
    {
      //print("#"+i+":");
      N = (Node) Network.get(i);
      d = PVector.sub(N.Pos,Pos).mag();
      boolean skip=false;

      if ((d>mindist)||(d>maxAcceptRange))
          {
            skip=true;   // act only if new object closer
            //println(" D too big"+d);
          }
      else if (N.maxLinks<=N.Links.size()) 
        {
          skip=true;  // act only if new object still accepts new links
          //println(" No new links accepted");  
        }
      else if (N==this)
        { 
          skip=true;  // Don't act an node itself!
          //println(" Node itself");  
         
        }
      else if (IsLinked(N)) 
        {
          skip=true;  // act only if Node is not already linked!
          //println(" Node already linked to this!");
        }
             
      if (!skip) // found closer node! Store node and distance
         {
         //println(" Found Node d="+d);
         mindist=d;
         minN = N;
         }
    }

    // Now the minimum distance Node which has not yet been linked and is NOT the identical copy has been found.
    if (minN!=this)
      {
        L = new Link(this,minN);
        //println("...added!");
        LinkList.add(L);
      }  
  }
  void LinkNearestN(int Nmax)
    {
      Nmax = min(Nmax,maxLinks);
      for (int i=0;i<Nmax;i++)
        {
          if (Links.size()<Nmax) LinkNearest();
        }
    }
 // Functions to move nodes
PVector GetTotalForce()
    {
      PVector F = new PVector(0,0);
       for (int k=0; k<Links.size();k++)
            {
              Link L = (Link) Links.get(k);  
              Node NO = L.GetLinkedNode(this);   // Neuron linked to this one via the link.
              PVector OForce = PVector.sub(NO.Pos,this.Pos);

              float d=OForce.mag();
              OForce.normalize();
              OForce.mult(d-range);
              OForce.mult(Fstrength);
              if (drawForceComponents)
                {
                 strokeWeight(2);
                 stroke(forceColor,150);
                 line(Pos.x,Pos.y,Pos.x+OForce.x,Pos.y+OForce.y);              
                }
               F.add(OForce);
            } 
            if (drawForce)
              {
           // F.mult( random()*(2*randommod)+(1-randommod));
                 strokeWeight(3);
                 stroke(forceColor,150);
                 line(Pos.x,Pos.y,Pos.x+F.x,Pos.y+F.y);    
              }
      if (Gravity) F.y+=0.01;
      return F;
    }
    
    
  void Move()
    {  
      PVector Force = this.GetTotalForce();
      Speed.add(Force);
      Speed.mult(friction);
      if (dampHighSpeed) while (Speed.mag()>10) Speed.mult(friction);
      Pos.add(Speed); 
      if (globalBoundary)
      {
      // Constrain movement to the area. It would be nicer to do this correctly along the movement direction. 
      // But for simplicity, only the according component is constrained. The error is small, as long speed is small.
         Pos.x=constrain(Pos.x,rad,width-rad);
         Pos.y=constrain(Pos.y,rad,height-rad);
      // check boarder. This is simply "flipping" the according speed component
           if (Pos.x<=rad)        Speed.x=abs(Speed.x);
           if (Pos.x>=width-rad)  Speed.x=abs(Speed.x)*(-1);
           if (Pos.y<=rad)        Speed.y=abs(Speed.y);
           if (Pos.y>=height-rad) Speed.y=abs(Speed.y)*(-1); 
      }
    }
  // Rekursive NetBrowsing
  
  void addToNet(ArrayList Net)
    {
      Net.add(this);
      inNetwork=true;
      for(int k=0;k<Links.size();k++)
        {
          L = (Link) Links.get(k);
          Node TestNode = L.GetLinkedNode(this);   // Neuron linked to this one via the link.
          // Check if this node is already in a Net
          if (!TestNode.inNetwork) TestNode.addToNet(Net);  // rekursive!!
        }
    }
    
 // Function to draw nodes
   void DrawMe()
  {
    if (drawRange)
      {
      stroke(255,0,255,20);
      strokeWeight(range*2);
      point(Pos.x,Pos.y);
      }
    if (drawNode)
      {
      strokeWeight(rad*2);
      stroke(col);
      point(Pos.x,Pos.y);
      }
    if (drawLinks)
      {
        strokeWeight(1);
        stroke(NodeLinkColor);
        for (int k=0;k<Links.size();k++)
          {
            L = (Link) Links.get(k);
            line(L.N1.Pos.x,L.N1.Pos.y,L.N2.Pos.x,L.N2.Pos.y);
          }
      }
  }
}


