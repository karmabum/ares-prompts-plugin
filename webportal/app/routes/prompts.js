import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import DefaultRoute from 'ares-webportal/mixins/default-route';

export default Route.extend(DefaultRoute, {
  gameApi: service(),  
  headData: service(),  

  model() {
    let api = this.gameApi;
    return api.requestOne('prompts');  
  },

  actions: {

    refreshPrompts() {
      let api = this.gameApi;
      api.requestOne('prompts').then((newPrompts) => {
        this.controller.set('model.prompts', newPrompts.prompts); 
      });
    }
  }
});
