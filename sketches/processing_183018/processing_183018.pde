
Segment seg, segA, segB;
Segment[] segments;
int  num_segs, delay, segment_length;
float seg0_x, seg0_y, anchor_x, anchor_y, theta;
PVector target;

void setup()
{
  size(400,400);
  num_segs = 6;
  segments  = new Segment[6];
  segment_length = 30;
  seg0_x = (float)width/2;
  seg0_y = (float)height/3;
  theta = -90.0;
 
  // initialize the arms (segments) in a stack
  for(int i=0; i< num_segs; i++)
      segments[i] = new Segment(seg0_x, seg0_y+i*segment_length, segment_length, theta,i, false);
 
 // position all segments
  for(int i = segments.length-1;i >= 1;i --)
  {
    segA = segments[i]; // starts at segment ç ends at segment 1
    segB = segments[i-1]; // starts at segment num_segs-2 ends at segment 0
   
    // now position the segments
    position_segment(segA, segB);
    
    seg = new Segment(segA.segment_x, segA.segment_y, 
              segA.segment_length,segA.theta, i, true);
    segments[i] = seg;
    seg = new Segment(segB.segment_x, segB.segment_y, 
              segment_length,segB.theta, i, true);
    segments[i-1] = seg;
  }

}

// Where the arm is pointing to!
 PVector reach( Segment seg, int dest_x, int dest_y)
  {
    PVector p = new PVector(0,0);
    int dx = (int)(dest_x - seg.segment_x);
    int dy = (int)(dest_y - seg.segment_y);
    double angle = Math.atan2(dy, dx);
    seg.rotate_segment(angle);
    p.x = (int)(dest_x - Math.cos(angle) * segment_length);
    p.y = (int)(dest_y - Math.sin(angle) * segment_length);
    return p;
  }
  
  void  position_segment(Segment _segA, Segment _segB)
  {
    // segA is the sixth segment
    // segB is the fifth segment
    segA = _segA;
    segB = _segB;
    
    double angle = segA.theta;

    float new_x = segA.segment_end_x;
    float new_y = segA.segment_end_y;
    
    segB.segment_x = new_x;
    segB.segment_y = new_y;

    
    segB.segment_end_x = (float)(new_x + Math.cos(2*PI*(angle/360)) * segment_length);
    segB.segment_end_y = (float)(new_y + Math.sin(2*PI*(angle/360)) * segment_length);
  }

// After all that - draw the result to the screen!
void draw()
{
   //This is the most important segment - the one that points to the mouse!
   seg =  segments[0];
   background(255,255,255);
   
   // rotate first arm to PVector to the mouse and get the returned target for the next arm to PVector at.
   target = reach(seg , mouseX, mouseY);
   
   // create new segment object
   seg = new Segment(seg.segment_x, seg.segment_y, segment_length,segments[0].theta, 0, true);
   
   //replace 0 with new arm PVectoring to mouse
   segments[0] = seg; 
  
  // rotate all the other segments
   for(int i = 1; i< segments.length; i++)
   {
      seg = segments[i];
      target = reach(seg,(int) target.x, (int)target.y);
      seg = new Segment(seg.segment_x, seg.segment_y, 
                segment_length,seg.theta, i, true);
      segments[i] = seg;
    }
  // position all segments
  for(int i = segments.length-1;i >= 1;i --)
  {
    segA = segments[i];
    segB = segments[i-1];;
    // now position the segments
    position_segment(segA, segB);
    seg = new Segment(segA.segment_x, segA.segment_y, 
              segment_length,segA.theta, i, true);
    segments[i] = seg;
    seg = new Segment(segB.segment_x, segB.segment_y, 
              segment_length,segB.theta, i, true);
    segments[i-1] = seg;
  }
  // now draw them all
  for(int i = 0 ; i<segments.length; i++)
  {
    seg = segments[i];
    seg.draw_segment();
  }
}
class Segment
{
  float  segment_x, segment_y, segment_end_x, segment_end_y ;
  double theta;
  int segment_length, segment_width = 10, segment_height = 4, segment_number;
  
  /* CONSTRUCTOR */
  Segment(float _end_x, float _end_y, int _segment_length, double _theta, int _segment_number, boolean start)
  {
      segment_number = _segment_number;
      segment_length = _segment_length;
      theta = _theta;
     
     if(!start)
     {
      segment_end_x = _end_x;
      segment_end_y = _end_y;
      // work out the starting point of the line
      segment_x = (float)(segment_end_x-segment_length*Math.cos(theta));
      segment_y = (float)(segment_end_y-segment_length*Math.sin(theta));
     }
     else
     {
       segment_x = _end_x;
       segment_y = _end_y;
       // work out the starting point of the line
       segment_end_x = (float)(segment_x+segment_length*Math.cos(theta));
       segment_end_y = (float)(segment_y+segment_length*Math.sin(theta));
     }
  }
  
  /* METHODS */
  
  void rotate_segment(double _theta)
  {
    theta = _theta;
    segment_end_x = (float)(segment_x+segment_length*Math.cos(theta));
    segment_end_y = (float)(segment_y+segment_length*Math.sin(theta));
  }
  
  
  void draw_segment()
  {
    line(segment_x, segment_y, segment_end_x, segment_end_y);
    ellipseMode(CENTER);  // Set ellipseMode to CENTER
    fill(0);  // Set fill to gray
    ellipse(segment_x, segment_y, 5, 5);  // Draw gray ellipse using CENTER mode
  }
}


