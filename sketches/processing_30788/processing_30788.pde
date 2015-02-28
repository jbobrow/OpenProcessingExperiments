
int c = int(args[0]);
String[] names = new String[c];
int[] scores = new int[c];

for(int i=0;i<c;i++){
  names[i] = args[2*i+1];
  scores[i] = args[2*i+2];
}

int maximum = int(max(scores));

for(int i=0;i<c;i++){
  if(scores[i]>=(maximum-10)){
    println(names[i]);
  }
}

