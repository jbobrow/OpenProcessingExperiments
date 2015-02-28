
// the function to output data to display
void output() {
  println("output");
  println(name);
  //println(btID);
  //println(name.length);
  for (int i=0; i<count.length; i++) {
  println(count[i] + ", " +btID[i] + ", " + name[i]);
  }
}



// the function to modify arrays by order
void arrayModify(int i) {
  int tempCount = count[i];
  String tempID = btID[i];
  String tempName = name[i];

  int[] countFront, countBehind; 
  countFront = subset(count, 0, i);
  if (i == count.length-1) countBehind = new int[0];
  else countBehind = subset(count, i+1);
  count = concat(countFront, countBehind);

  String[] btIDFront, btIDBehind;
  btIDFront = subset(btID, 0, i);
  if (i == btID.length-1) btIDBehind = new String[0];
  else btIDBehind = subset(btID, i+1);
  btID = concat(btIDFront, btIDBehind); 

  String[] nameFront, nameBehind;
  nameFront = subset(name, 0, i);
  if (i == name.length-1) nameBehind = new String[0];
  else nameBehind = subset(name, i+1);
  name = concat(nameFront, nameBehind); 

  if (max(count) <= tempCount) {
    count = splice(count, tempCount, 0);
    btID = splice(btID, tempID, 0);
    name = splice(name, tempName, 0);
  }
  else if (min(count) >= tempCount) {
    count = append(count, tempCount);
    btID = append(btID, tempID);
    name = append(name, tempName);
  }
  else {
    for (int j=0; j<count.length; j++) {
      if (count[j] <= tempCount) {
        count = splice(count, tempCount, j);
        btID = splice(btID, tempID, j);
        name = splice(name, tempName, j);
        j = count.length;      
      }
    }
  }
}

