
class Record {
int count;
String date; 
int monthOfSighgting;
String YearofSighting;
 int DayOfSighgting;
int intYear; 
Record (){
}


void getInfo(String ufoData){
   String[] pieces = split(ufoData, TAB ); //load data into array
    String date = pieces[0]; 

    if (date.length() == 8) {
       YearofSighting = (date.substring(0, 4)); 
      monthOfSighgting = int(date.substring(4, 6));
      DayOfSighgting = int(date.substring(6, 8));
        intYear = int(date.substring(0, 4)); 

    }
}
void count(){
count++;
}

int returncount(){
return(count); 
}


}

