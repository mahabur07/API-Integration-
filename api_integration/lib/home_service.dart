import 'package:http/http.dart' as http;

class HomeService {

  Future<http.Response> getProducts() async {
    String url = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }
  Future<http.Response> getCategories() async {
    String url = "https://fakestoreapi.com/products/categories";
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> getProductsByCategories(String Category) async {
    String url = "https://fakestoreapi.com/products/category/${Category}";
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> postProducts(Map<String, dynamic> products) async {
    String url = "https://fakestoreapi.com/products";
    http.Response response = await http.post(Uri.parse(url));
    return response;
  }

  Future<http.Response> UpdateProducts(Map<String, dynamic> products,String Id) async {
    String url = "https://fakestoreapi.com/products/${Id.toString()}";
    http.Response response = await http.put(Uri.parse(url));
    return response;
  }

  Future<http.Response> DeleteProducts(String Id) async {
    String url = "https://fakestoreapi.com/products/${Id.toString()}";
    http.Response response = await http.delete(Uri.parse(url));
    return response;
  }
}
