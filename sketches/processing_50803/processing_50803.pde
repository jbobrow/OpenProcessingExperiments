


/**
 *date and type of name
 */
public class Event {
  /** The date */
  public float date;

  /** The name*/
  public String name;
  public String place;
  public String description;
  /**
   * 
   */
  public Event() {
  }


  public Event(float date, String name, String description) {
    this.date = date;
    this.name = name;
    this.description = description;
  }
  
    public Event(float date, String name, String place, String description) {
    this.date = date;
    this.name = name;
    this.place = place;
    this.description = description;
  }


  public void set(float date, String name, String description) {
    this.date = date;
    this.name = name;
    this.description = description;
  }
  
  //display the dates on a scale
  // scaleLow == furthest date in the past
  // span == how large the graph is (on the x axis)
  // y == where on the y exis the line should be
  //magnitude == how large the mark should be
  
  
    public void display(float scaleLow, float span, float y, float magnitude) {
      
      
     float x = map(date,scaleLow, 2010,0, span);
     
     if(x>0){
      translate(x,y);
      ellipse(0, 0 , magnitude, magnitude);
      
      rotate(radians(-45));
      text(name, magnitude*1.6,0);
      rotate(radians(45));
      
       translate(0,50);
       rotate(radians(-90));    
       text(int(date), 0,0);
       line(0,0,50,00);
       rotate(radians(90));
       translate(0,-50);
       
        
       if(mouseX < (x + 5) && mouseX > (x - 5) && mouseY > 220){
         
           ellipse(0, 0 , magnitude*3, magnitude*3);
           
          // ellipse(0, 0 , magnitude, magnitude);
         text(description, -(x-5),-(y-20));
       }
      translate(-x,-y);
     }
  }
  /**
   * Get a copy of this vector.
   */
  public Event get() {
    return new Event(date, name, description);
  }

  /**
   * time difference
   */
  public float dist(Event v1, Event v2) {

    return v1.date - v2.date;
  }
}



