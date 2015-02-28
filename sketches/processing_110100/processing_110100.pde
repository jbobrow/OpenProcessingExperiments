
void setup() 
{  //setup function called initially, only once
  size(1000, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  noLoop();
 // fill(#FFFFFF);
}

void draw() 
{
    BinTree T1 = new BinTree();
    for(int i=0;i<10;i++)
       T1.addNode((int)(1+random(100)));
    T1.paint();
}
class BinTree
{
  Node root = null;
  class Node
  {
    public int k, r;
    public int x, y;
    public int depth; 
    Node left=null,right=null;
    public Node(int k, int depth, int x, int y)
    { 
      this.k=k; 
      this.depth=depth; 
      this.x=x;
      this.y=y;
      //this.r=((50-12*depth)>15)?50-12*depth:15;
      if (50-2*sqrt(depth)>15)
        this.r=round(50-2*sqrt(depth));
      else
        this.r=15;

    }
  }  
  public void addNode(int key)
  {
    Node p=null,cur=root; 
    if(root==null)
      root = new Node(key,4,width/2,50);
    else
    {
      while(cur != null)
      {
        p=cur; 
        if(key<cur.k)
          cur = cur.left; 
        else
          cur = cur.right; 
      }
      if(key<p.k)
        p.left = new Node(key,p.depth*2,p.x-(width/p.depth),p.y+50);
      else
        p.right = new Node(key,p.depth*2,p.x+(width/p.depth),p.y+50);
      
    } 
  }
  public void paint()
   {
      proc(root);
   }
    
  void proc(Node p)
  {

    if(p!=null)
    {
      if(p.left!=null)
      {
        line(p.x,p.y,p.left.x,p.left.y);
        proc(p.left);
      }

      if(p.right!=null)
      {
        line(p.x,p.y,p.right.x,p.right.y);
        proc(p.right);
      }
      textSize(p.r*2/5);
      fill(#FFFFFF);
      ellipse(p.x,p.y,p.r,p.r);
      fill(#000000);
      if (p.k / 10 == 0)
        text(p.k, p.x-p.r/9, p.y+p.r/7); 
      else
        text(p.k, p.x-p.r/4, p.y+p.r/7); 
    }

  }
  
}
