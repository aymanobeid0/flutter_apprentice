import 'package:http/http.dart' as h;
import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';

const String apiKey = '17b11a0f';
const String apiId = 'd59b9d8ce810db6dd76750662e6c6754';
const String apiUrl = 'https://api.edamam.com/search';

// TODO: Add @ChopperApi() here
@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from, @Query('to') int to);
  // TODO: Add create()
}

// TODO: Add _addQuery()
// class RecipeService {
//   Future<dynamic> getRecipes(String query, int from, int to) async {
//     final recipeData = await getData(
//         '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
//     return recipeData;
//   }

//   Future getData(String url) async {
//     print('Calling uri: $url');
//     final response = await get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
