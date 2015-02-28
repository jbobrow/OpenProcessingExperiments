
// 切勿更動本檔案內容
String URL = "http://finance.yahoo.com/d/quotes.csv?s=IBM+AAPL+EBAY+GOOG+AMZN+DD+CAT+T+MCD+F+AXP+V+PM+RHT+MSFT+JAVA&f=nob2b3c6jk";
String[] data;
StockQuote[] stockInfo;

void loadData() {
  data = loadStrings(URL);
  //println(data);
  //println(data.length);
  //if (data == null) { line(0,0,width,height); return; }

  stockInfo = new StockQuote[data.length];

  for (int i=0; i<data.length; i++) {
    stockInfo[i] = new StockQuote();
    String[] yahooStockInput = data[i].split(",");
    //println(yahooStockInput);
    if (yahooStockInput.length == 7) {
    stockInfo[i].name = yahooStockInput[0].replaceAll("\"","");
    stockInfo[i].openPrice = float(yahooStockInput[1]);
    stockInfo[i].askPrice = float(yahooStockInput[2]);
    stockInfo[i].bidPrice = float(yahooStockInput[3]);
    stockInfo[i].change = float(yahooStockInput[4].replaceAll("\"",""));
    stockInfo[i].yearLow = float(yahooStockInput[5]);
    stockInfo[i].yearHigh = float(yahooStockInput[6]);
    } else {
    stockInfo[i].name = yahooStockInput[0].replaceAll("\"","") + "," + yahooStockInput[1].replaceAll("\"","");
    stockInfo[i].openPrice = float(yahooStockInput[2]);
    stockInfo[i].askPrice = float(yahooStockInput[3]);
    stockInfo[i].bidPrice = float(yahooStockInput[4]);
    stockInfo[i].change = float(yahooStockInput[5].replaceAll("\"",""));
    stockInfo[i].yearLow = float(yahooStockInput[6]);
    stockInfo[i].yearHigh = float(yahooStockInput[7]);
    }

    //println(stockInfo[i].name+": "+stockInfo[i].openPrice+","+stockInfo[i].askPrice+","+stockInfo[i].bidPrice+","+stockInfo[i].change+","+stockInfo[i].yearLow+","+stockInfo[i].yearHigh);

  }

}

void drawData() {
  float gap = width/stockInfo.length;
  for (int i=0; i<stockInfo.length; i++) {
    stockInfo[i].draw(40+i*gap, 350);
  }
}

