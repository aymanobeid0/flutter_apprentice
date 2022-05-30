import 'package:http/http.dart' as h;
import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
part 'recipe_service.chopper.dart';

const String apiKey = 'd59b9d8ce810db6dd76750662e6c6754';
const String apiId = '17b11a0f';
const String apiUrl = 'https://api.edamam.com';

// TODO: Add @ChopperApi() here
@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: 'search')
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from, @Query('to') int to);
  // TODO: Add create()

  static RecipeService create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$RecipeService(),
      ],
    );
    return _$RecipeService(client);
  }
}

// TODO: Add _addQuery()
Request _addQuery(Request req) {
  final params = Map<String, dynamic>.from(req.parameters);
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  return req.copyWith(parameters: params);
}


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
