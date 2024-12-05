/*
4. Dynamic Key JSON
Dummy API URL: https://example.com/api/sales
Sample JSON Response:
json
Copy code
{
  "2021": { "sales": 10000, "profit": 2500 },
  "2022": { "sales": 15000, "profit": 3500 }
}
*/

class YearlyData {
  final int sales;
  final int profit;

  YearlyData({required this.sales, required this.profit});

  factory YearlyData.fromJson(Map<String, dynamic> json) {
    return YearlyData(
      sales: json['sales'],
      profit: json['profit'],
    );
  }
}

class SalesData {
  final Map<String, YearlyData> yearlyData;

  SalesData({required this.yearlyData});

  factory SalesData.fromJson(Map<String, dynamic> json) {
    Map<String, YearlyData> parsedData = {};
    json.forEach((key, value) {
      parsedData[key] = YearlyData.fromJson(value);
    });
    return SalesData(yearlyData: parsedData);
  }
}
