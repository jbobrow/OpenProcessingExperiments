
          ArrayList<String> s = new ArrayList();

          size (400,400);
          s.add("a"+str('b')); 
          s.add("Hello");
          s.add("there!");

          for (int j = 0; j< s.size(); j++) {
            String myText = s.get(j);
           
            font = loadFont("YuppyTC-Regular-40.vlw");
            textFont(font);
            textSize(20);
            fill(200, 255, 255);
            text(myText, 20*j+33, 39*j+39);
          } // for
          
          
