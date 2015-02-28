
class ListList {
  ArrayList<CoordinateHolder> ll;

  ListList () {
    ll = new ArrayList();
  }

  void addCH(CoordinateHolder ch) {
    ll.add(ch);
    ch.findScales();
  }

  void printCH() {
    for (int i=0; i<ll.size(); i++) {
      println(nf(i, 2) + " " + ll.get(i).pvs);
    }
  }
  
  CoordinateHolder getCH(int n) {
    return ll.get(n);
  }
  
  int chNum = 0;
  void plotRoute(int n) {
    CoordinateHolder ch = ll.get(n);
    //for (int i=0; i<ch.pvs.size(); i++) {
       PVector pv = ch.pvs.get(chNum);
       fill((pv.z-ch.findMin(2))*ch.altScale, 500, 500, 125);
      // println(pv.z-ch.findMin(2)*ch.altScale);
       println("Altitude Scalar: " + ch.altScale);
       println("Minimum Altitude: " + ch.findMin(2));
       println("Current Altitude: " + pv.z);
       ellipse((pv.x-ch.findMin(0))*ch.longScale, (pv.y-ch.findMin(1))*ch.latScale, 10, 10);
       //saveFrame("##########.PNG");
       //delay(30);
       chNum++;
      // if (chNum>ch.pvs.size()-1) {chNum = 0;}
       
      // println(pv.x-ch.findMin(0));
    //}  
  }
}


