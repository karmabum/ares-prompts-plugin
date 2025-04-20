import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import DefaultRoute from 'ares-webportal/mixins/default-route';

export default Route.extend(DefaultRoute, {
  gameApi: service(),

  model() {
    let api = this.gameApi;
    return api.requestOne('bingo');
  },

  actions: {
    refreshBingo() {
      let api = this.gameApi;
      api.requestOne('bingo').then((newBingo) => {
        this.controller.set('model', newBingo);
      });
    }
  }
});
