// ignore_for_file: prefer_interpolation_to_compose_strings

class AppUrl {
  // our base URL of an api
  static const baseUrl = 'https://disease.sh/v3/covid-19/';

  // fetch apis data

  // for whole world
  static const worldStateApi = baseUrl + 'all';

  // for only country
  static const countryApi = baseUrl + 'countries';
}
