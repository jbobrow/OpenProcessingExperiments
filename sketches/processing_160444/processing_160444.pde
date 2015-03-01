
List myList=new List("ABFGCE");

void setup() {  //setup function called initially, only once
  size(750, 700);
  smooth();
  work();
}

void work() {
  myList.draw();
  new List("DDD").draw();
  new List("").draw();

}


public abstract class AbstractListItem {
  protected Object content;
  public AbstractListItem(Object cont) {
    content=cont;
  }
  public abstract Object getContent();
  public abstract void setContent(Object newContent);
  public abstract ListItem getNext();
  public abstract void setNext(ListItem nextItem);
}

public class List {
  ListItemPainter painter=new ListItemPainter();
  protected ListItem firstItem;
  protected ListItem currentItem;
  public List(String startItems) {
    if (startItems.length()>0) {
      firstItem=new ListItem(""+startItems.charAt(0));
      currentItem=firstItem;
      for (int i=1; i<startItems.length (); i++) {
        currentItem.setNext(new ListItem(""+startItems.charAt(i)));
        currentItem=currentItem.getNext();
      }
      currentItem=firstItem;
    }
  }

  public void draw() {
    int i=0;
    ListItem drawItem=firstItem;
    while (drawItem!=null) {
      i++;
      drawItem=drawItem.getNext();
    }
    if (i==0)return;
    float itemWidth=min(80, width/i);
    drawItem=firstItem;
    pushMatrix();
    scale(itemWidth);
    while (drawItem!=null) {
      painter.draw(drawItem);
      if (drawItem==firstItem) {
        textSize(0.2);
        textAlign(CENTER, CENTER);
        pushMatrix();
        translate(0.18, 0.14);
        text("F", 0, 0);
        popMatrix();
      }
      if (drawItem==currentItem) {
        textSize(0.2);
        textAlign(CENTER, CENTER);
        pushMatrix();
        translate(0.32, 0.14);
        text("C", 0, 0);
        popMatrix();
      }
      translate(1, 0);
      drawItem=drawItem.getNext();
    }
    popMatrix();
    translate(0, itemWidth*0.9);
  }
  //Hier müssen Listenoperationen folgen!

  public void insert(Object newContent) {
    ListItem newItem=new ListItem(newContent);
    if (currentItem!=null) {
      newItem.setNext(currentItem);
      if (currentItem==firstItem) {
        firstItem=newItem;
      } else {
        ListItem seek=firstItem;
        while (seek.getNext ()!=currentItem)seek=seek.getNext();
        seek.setNext(newItem);
      }
    }
  }

}
public class ListItem extends AbstractListItem {
  protected ListItem next;
  public ListItem(Object cont) {
    super(cont);
  }

  public Object getContent() {
    return content;
  }
  public void setContent(Object newContent) {
    content=newContent;
  }
  public ListItem getNext() {
    return next;
  }
  public void setNext(ListItem nextItem) {
    next=nextItem;
  }
}

public class ListItemPainter {
  public void draw(ListItem thisItem) {
    Object content=thisItem.getContent();
    pushMatrix();
    scale(0.01);
    stroke(0);
    strokeWeight(2);
    fill(255);
    ellipseMode(CENTER);
    ellipse(30, 50, 60, 60);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text(content.toString().charAt(0), 30, 50);
    translate(20, 0);
    line(40, 50, 80, 50);
    line(65, 35, 80, 50);
    line(65, 65, 80, 50);
    popMatrix();
  }
}

